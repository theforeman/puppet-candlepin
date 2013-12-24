# Candlepin Database Setup
class candlepin::database {

  # Temporary direct use of liquibase to initiall migrate the candlepin database
  # until support is added in cpdb - https://bugzilla.redhat.com/show_bug.cgi?id=1044574
  include postgresql::server
  postgresql::db { $candlepin::db_name:
    user     => $candlepin::db_user,
    password => postgresql_password($candlepin::db_user, $candlepin::db_pass),
  } ~>
  exec { 'cpdb':
    path        => '/bin:/usr/bin',
    command     => "liquibase --driver=org.postgresql.Driver \
                          --classpath=/usr/share/java/postgresql-jdbc.jar:/var/lib/${candlepin::tomcat}/webapps/candlepin/WEB-INF/classes/ \
                          --changeLogFile=db/changelog/changelog-create.xml \
                          --url=jdbc:postgresql:candlepin \
                          --username=${candlepin::db_user}  \
                          --password=${candlepin::db_name} \
                          migrate \
                          -Dcommunity=False \
                          >> ${candlepin::params::cpdb_log} \
                          2>&1 && touch /var/lib/candlepin/cpdb_done",
    creates     => "${candlepin::log_dir}/cpdb_done",
    refreshonly => true,
    require     => [
      File[$candlepin::log_dir],
      File['/etc/candlepin/candlepin.conf']
    ],
  }

}
