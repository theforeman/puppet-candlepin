# Candlepin Database Setup using Mysql
class candlepin::database::mysql {
  $db_dialect = 'org.hibernate.dialect.MySQLDialect'
  $db_driver = 'com.mysql.jdbc.Driver'
  $db_default_port = 3306
}