# Candlepin Database Setup using Postgreql
class candlepin::database::postgresql{

  $db_dialect = 'org.hibernate.dialect.PostgreSQLDialect'
  $db_quartz_dialect = 'org.quartz.impl.jdbcjobstore.PostgreSQLDelegate'
  $db_driver = 'org.postgresql.Driver'
  $db_type = $::candlepin::db_type
  $db_host = $::candlepin::db_host
  $db_port = pick($::candlepin::db_port, 5432)
  $db_name = $::candlepin::db_name
  $db_user = $::candlepin::db_user
  $db_password = $::candlepin::db_password
  $enable_hbm2ddl_validate = $::candlepin::enable_hbm2ddl_validate

  concat::fragment{'PostgreSQL Database Configuration':
    target  => $::candlepin::candlepin_conf_file,
    content => template('candlepin/_candlepin_database.conf.erb'),
  }

  if $candlepin::manage_db == true {
    # Prevents errors if run from /root etc.
    Postgresql_psql {
      cwd => '/',
    }

    # Temporary direct use of liquibase to initiall migrate the candlepin database
    # until support is added in cpdb - https://bugzilla.redhat.com/show_bug.cgi?id=1044574
    include ::postgresql::client, ::postgresql::server
    postgresql::server::db { $db_name:
      user     => $db_user,
      password => postgresql_password($db_user, $db_password),
      encoding => 'utf8',
      locale   => 'en_US.utf8',
      before   => Exec['cpdb'],
    }
    Postgresql::Server::Role[$db_user] -> Postgresql::Server::Database[$db_name]
  }

  exec { 'cpdb':
    path        => '/bin:/usr/bin',
    command     => "liquibase --driver=org.postgresql.Driver \
                          --classpath=/usr/share/java/postgresql-jdbc.jar:/var/lib/${candlepin::tomcat}/webapps/candlepin/WEB-INF/classes/ \
                          --changeLogFile=db/changelog/changelog-create.xml \
                          --url=jdbc:postgresql://${db_host}:${db_port}/${db_name} \
                          --username=${db_user}  \
                          --password=${db_password} \
                          migrate \
                          -Dcommunity=False \
                          >> ${candlepin::log_dir}/cpdb.log \
                          2>&1 && touch /var/lib/candlepin/cpdb_done",
    creates     => "${candlepin::log_dir}/cpdb_done",
    refreshonly => true,
    before      => Service[$candlepin::tomcat],
    require     => [
      Package['candlepin'],
      Concat['/etc/candlepin/candlepin.conf']
    ],
  }
}
