# Candlepin Database Setup
class candlepin::database{

  case $candlepin::db_type {
    'postgresql': {
      class{'candlepin::database::postgresql': }
      $db_dialect = $::candlepin::database::postgresql::db_dialect
      $db_driver = $::candlepin::database::postgresql::db_driver
      $db_default_port = $::candlepin::database::postgresql::db_default_port
    }
    'mysql': {
      class{'candlepin::database::mysql': }
      $db_dialect = $::candlepin::database::mysql::db_dialect
      $db_driver = $::candlepin::database::mysql::db_driver
      $db_default_port = $::candlepin::database::mysql::db_default_port
    }
    default: {
      err("Invalid db_type selected: ${candlepin::db_type}. Valid options are ['mysql','postgresql'].")
    }
  }

}