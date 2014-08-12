# Candlepin Database Setup
class candlepin::database{

  case $candlepin::db_type {
    'postgresql': {
      $db_dialect = 'org.hibernate.dialect.PostgreSQLDialect'
      $db_driver = 'org.postgresql.Driver'
      $db_default_port = 5432
      if $candlepin::manage_db == true {
        class{'candlepin::database::postgresql': }
      }
    }
    'mysql': {
      $db_dialect = 'org.hibernate.dialect.MySQLDialect'
      $db_driver = 'com.mysql.jdbc.Driver'
      $db_default_port = 3306
      if $candlepin::manage_db == true {
        class{'candlepin::database::mysql': }
      }
    }
    default: {
      err("Invalid db_type selected: ${candlepin::db_type}. Valid options are ['mysql','postgresql'].")
    }
  }

  if $candlepin::db_port {
    $db_port_real = $candlepin::db_port
  }
  else{
    $db_port_real = $db_default_port
  }

}