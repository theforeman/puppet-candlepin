# Candlepin Database Setup
class candlepin::database{

  if $candlepin::manage_db == true {
    case $candlepin::db_type {
      'postgresql': {
        class{'candlepin::database::postgresql': }
      }
      'mysql': {
        class{'candlepin::database::mysql': }
      }
      default: {
        err("Unknown database type: ${candlepin::db_type}")
      }
    }
  }

}