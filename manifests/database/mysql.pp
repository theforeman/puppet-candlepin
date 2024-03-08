# Candlepin Database Setup using Mysql
#
# @api private
class candlepin::database::mysql (
  # lint:ignore:parameter_types
  $candlepin_conf_file = $candlepin::candlepin_conf_file,
  $db_dialect = 'org.hibernate.dialect.MySQLDialect',
  $db_quartz_dialect = 'org.quartz.impl.jdbcjobstore.StdJDBCDelegate',
  $db_driver = 'com.mysql.jdbc.Driver',
  $db_type = $candlepin::db_type,
  $db_host = $candlepin::db_host,
  $db_port = pick($candlepin::db_port, 3306),
  $db_name = $candlepin::db_name,
  $db_user = $candlepin::db_user,
  $db_password = $candlepin::_db_password,
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
    'db_name'                 => $db_name,
    'db_user'                 => $db_user,
    'db_password'             => $db_password,
    'enable_hbm2ddl_validate' => $enable_hbm2ddl_validate,
  }

  concat::fragment { 'Mysql Database Configuration':
    target  => $candlepin_conf_file,
    content => epp('candlepin/_candlepin_database.conf.epp', $context),
  }
}
