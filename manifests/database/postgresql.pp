# Candlepin Database Setup using Postgresql
#
# @api private
class candlepin::database::postgresql (
  # lint:ignore:parameter_types
  $candlepin_conf_file     = $candlepin::candlepin_conf_file,
  $db_dialect              = 'org.hibernate.dialect.PostgreSQLDialect',
  $db_quartz_dialect       = 'org.quartz.impl.jdbcjobstore.PostgreSQLDelegate',
  $db_driver               = 'org.postgresql.Driver',
  $manage_db               = $candlepin::manage_db,
  $init_db                 = $candlepin::init_db,
  $db_type                 = $candlepin::db_type,
  $db_host                 = $candlepin::db_host,
  $db_port                 = pick($candlepin::db_port, 5432),
  $db_ssl                  = $candlepin::db_ssl,
  $db_ssl_verify           = $candlepin::db_ssl_verify,
  $db_ssl_ca               = $candlepin::db_ssl_ca,
  $db_name                 = $candlepin::db_name,
  $db_user                 = $candlepin::db_user,
  $db_password             = $candlepin::_db_password,
  $enable_hbm2ddl_validate = $candlepin::enable_hbm2ddl_validate,
  # lint:endignore
) {
  assert_private()

  $context = {
    'db_dialect'              => $db_dialect,
    'db_quartz_dialect'       => $db_quartz_dialect,
    'db_driver'               => $db_driver,
    'db_type'                 => $db_type,
    'db_host'                 => $db_host,
    'db_port'                 => $db_port,
    'db_ssl'                  => $db_ssl,
    'db_ssl_verify'           => $db_ssl_verify,
    'db_ssl_ca'               => $db_ssl_ca,
    'db_name'                 => $db_name,
    'db_user'                 => $db_user,
    'db_password'             => $db_password,
    'enable_hbm2ddl_validate' => $enable_hbm2ddl_validate,
  }

  concat::fragment { 'PostgreSQL Database Configuration':
    target  => $candlepin_conf_file,
    content => epp('candlepin/_candlepin_database.conf.epp', $context),
  }

  if $manage_db {
    # Prevents errors if run from /root etc.
    Postgresql_psql {
      cwd => '/',
    }

    include postgresql::client, postgresql::server
    postgresql::server::db { $db_name:
      user     => $db_user,
      password => postgresql::postgresql_password($db_user, $db_password),
      encoding => 'utf8',
      locale   => 'en_US.utf8',
    }
  }

  if $init_db {
    $ssl_verify_options = $db_ssl_verify ? {
      false => '&sslfactory=org.postgresql.ssl.NonValidatingFactory',
      default => ''
    }

    if $db_ssl_ca {
      $ssl_ca_options = "&sslrootcert=${db_ssl_ca}"
    } else {
      $ssl_ca_options = '' # lint:ignore:empty_string_assignment
    }

    $ssl_options = $db_ssl ? {
      true  => "?ssl=true${ssl_verify_options}${ssl_ca_options}",
      default => ''
    }

    cpdb_create { $db_name:
      ensure      => present,
      db_host     => $db_host,
      db_port     => $db_port,
      db_user     => $db_user,
      db_password => $db_password,
      ssl_options => $ssl_options,
    } ->
    cpdb_update { $db_name:
      ensure      => present,
      db_host     => $db_host,
      db_port     => $db_port,
      db_user     => $db_user,
      db_password => $db_password,
      ssl_options => $ssl_options,
    }

    # if both manage_db and init_db enforce order of resources
    if $manage_db {
      Postgresql::Server::Db[$db_name] -> Cpdb_create[$db_name]
    }
  }
}
