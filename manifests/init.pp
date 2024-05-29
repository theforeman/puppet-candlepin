# Manage a Candlepin server
#
# @param oauth_key
#   The OAuth key for talking to the candlepin API
#
# @param oauth_secret
#   The OAuth secret for talking to the candlepin API
#
# @param manage_db
#   Whether a database should be installed, this includes db creation and user
#
# @param init_db
#   Whether a database should be initialised.
#
# @param db_type
#   The type of database Candlepin will be connecting too.
#
# @param db_host
#   Hostname of database server.
#
# @param db_port
#   Port the database listens on. Only needs to be provided if different from
#   standard port of the :db_type.

# @param facts_match_regex
#   Optional regex to filter consumer facts; if provided, will be added to the
#   Candlepin configuration file.
#
# @param db_ssl
#   Boolean indicating if the connection to the database should be over an SSL
#   connection.
#
# @param db_ssl_verify
#   Boolean indicating if the SSL connection to the database should be verified
#
# @param db_ssl_ca
#   The CA certificate to verify the SSL connection to the database with
#
# @param db_name
#   The name of the Candlepin database
#
# @param db_user
#   The Candlepin database username
#
# @param db_password
#   The Candlepin database password
#
# @param user_groups
#   The user groups for the Candlepin tomcat user
#
# @param log_dir
#   Directory for Candlepin logs
#
# @param loggers
#   Set the log levels for loggers
#
# @param env_filtering_enabled
#   If subscription filtering is done on a per environment basis
#
# @param keystore_file
#   Tomcat keystore file to use
#
# @param keystore_password
#   Password for keystore being used with Tomcat
#
# @param keystore_type
#   Keystore type
#
# @param truststore_file
#   Truststore file to use for Tomcat and Artemis
#
# @param truststore_password
#   Password for truststore being used with Tomcat and Artemis
#
# @param ca_key
#   CA key file to use
#
# @param ca_cert
#   CA certificate file to use
#
# @param ca_key_password
#   CA key password
#
# @param ciphers
#   Allowed ciphers for ssl connection
#
# @param tls_versions
#   Allowed versions of TLS, for example 1.1, 1.2, etc
#
# @param version
#   Version of Candlepin to install
#
# @param java_package
#   Use in conjunction with java_home to specify the JVM used by Tomcat
#
# @param adapter_module
#   Candlepin adapter implementations to inject into the java runtime
#
# @param enable_basic_auth
#   Whether to enable HTTP basic auth
#
# @param enable_trusted_auth
#   Whether to enable trusted auth
#
# @param consumer_system_name_pattern
#   Regex that consistutes a valid consumer name
#
# @param enable_hbm2ddl_validate
#   If true will perform a schema check to ensure compliance with the models.
#   Disabling this feature may be required if modifications are required to schema
#
# @param ssl_port
#   Port to deploy SSL enabled Tomcat server on
#
# @param host
#   Host to deploy Tomcat server on; defaults to localhost
#
# @param candlepin_conf_file
#   Configuration file location for candlepin
#
# @param tomcat_base
#   In new-style instances, if CATALINA_BASE isn't specified, it will be
#   constructed by joining TOMCATS_BASE and NAME.
#
# @param tomcat_conf
#   Where your the tomcat configuration lives
#
# @param java_home
#   Where your java installation lives
#
# @param catalina_home
#   Where your tomcat installation lives
#
# @param catalina_tmpdir
#   System-wide tmp
#
# @param java_opts
#   Java Parameters
#
# @param lang
#   Tomcat locale setting
#
# @param security_manager
#   Run tomcat under the Java Security Manager
#
# @param shutdown_wait
#   Time to wait in seconds, before killing process
#
# @param expired_pools_schedule
#   Quartz schedule notation for how often to run the ExpiredPoolsJob
#
# @param artemis_port
#   Port to expose Artemis on
#
# @param artemis_host
#   Host address to have Artemis listen on; defaults to localhost
#
# @param artemis_client_dn
#   Full DN for the client certificate used to talk to Artemis
#
# @param broker_config_file
#   Config file for Artemis
#
# @param user
#   User under which Candlepin will run
#
# @param group
#   Primary group for the Candlepin user
#
# @param disable_fips
#   Disable FIPS within the Java environment for Tomcat explicitly.
#   When set to false, no flag is added. Then on FIPS enabled systems, a Candlepin build that supports FIPS is required.
#
# @param db_manage_on_startup
#   How to manage database migrations on startup.
#
# @example Set debug logging
#   class { 'candlepin':
#     loggers => {
#       'org.candlepin' => 'DEBUG',
#     },
#   }
#
class candlepin (
  Boolean $manage_db = true,
  Boolean $init_db = true,
  Enum['postgresql','mysql'] $db_type = 'postgresql',
  Stdlib::Host $db_host = 'localhost',
  Optional[Stdlib::Port] $db_port = undef,
  Optional[String[1]] $facts_match_regex = undef,
  Boolean $db_ssl = false,
  Boolean $db_ssl_verify = true,
  Optional[Stdlib::Absolutepath] $db_ssl_ca = undef,
  String $db_name = 'candlepin',
  String $db_user = 'candlepin',
  Variant[Sensitive[String], String] $db_password = $candlepin::params::db_password,
  Variant[Array[String], String] $user_groups = [],
  Stdlib::Absolutepath $log_dir = '/var/log/candlepin',
  Hash[String[1], Candlepin::LogLevel] $loggers = {},
  Variant[Sensitive[String], String] $oauth_key = 'candlepin',
  Variant[Sensitive[String], String] $oauth_secret = 'candlepin',
  Boolean $env_filtering_enabled = true,
  Stdlib::Absolutepath $keystore_file = '/etc/candlepin/certs/keystore',
  Optional[Variant[Sensitive[String], String]] $keystore_password = undef,
  String $keystore_type = 'PKCS12',
  Stdlib::Absolutepath $truststore_file = '/etc/candlepin/certs/truststore',
  Optional[Variant[Sensitive[String], String]] $truststore_password = undef,
  Stdlib::Absolutepath $ca_key = '/etc/candlepin/certs/candlepin-ca.key',
  Stdlib::Absolutepath $ca_cert = '/etc/candlepin/certs/candlepin-ca.crt',
  Optional[Variant[Sensitive[String], String]] $ca_key_password = undef,
  Array[String] $ciphers = $candlepin::params::ciphers,
  Array[String] $tls_versions = ['1.2'],
  Optional[String[1]] $java_package = undef,
  String $version = 'present',
  Optional[String] $adapter_module = undef,
  Boolean $enable_hbm2ddl_validate = true,
  Boolean $enable_basic_auth = true,
  Boolean $enable_trusted_auth = false,
  Optional[String] $consumer_system_name_pattern = undef,
  Stdlib::Port $ssl_port = 8443,
  Stdlib::Host $host = 'localhost',
  Stdlib::Absolutepath $candlepin_conf_file = '/etc/candlepin/candlepin.conf',
  Stdlib::Absolutepath $tomcat_base = '/var/lib/tomcats/',
  Stdlib::Absolutepath $tomcat_conf = '/etc/tomcat',
  Stdlib::Absolutepath $java_home = '/usr/lib/jvm/jre',
  Stdlib::Absolutepath $catalina_home = '/usr/share/tomcat',
  Stdlib::Absolutepath $catalina_tmpdir = '/var/cache/tomcat/temp',
  String $java_opts = '-Xms1024m -Xmx4096m',
  Optional[String] $lang = undef,
  Boolean $security_manager = false,
  Optional[Integer[0]] $shutdown_wait = undef,
  String $expired_pools_schedule = '0 0 0 * * ?',
  Stdlib::Host $artemis_host = 'localhost',
  Stdlib::Port $artemis_port = 61613,
  Variant[Deferred, String] $artemis_client_dn = 'CN=ActiveMQ Artemis Client, OU=Artemis, O=ActiveMQ, L=AMQ, ST=AMQ, C=AMQ',
  Stdlib::Absolutepath $broker_config_file = '/etc/candlepin/broker.xml',
  String $user = 'tomcat',
  String $group = 'tomcat',
  Boolean $disable_fips = true,
  Enum['None', 'Report', 'Halt', 'Manage'] $db_manage_on_startup = 'Manage',
) inherits candlepin::params {
  contain candlepin::service

  $_ca_key_password = if $ca_key_password =~ String { Sensitive($ca_key_password) } else { $ca_key_password }
  $_oauth_key = if $oauth_key =~ String { Sensitive($oauth_key) } else { $oauth_key }
  $_oauth_secret = if $oauth_secret =~ String { Sensitive($oauth_secret) } else { $oauth_secret }
  $_db_password = if $db_password =~ String { Sensitive($db_password) } else { $db_password }
  $_keystore_password = if $keystore_password =~ String { Sensitive($keystore_password) } else { $keystore_password }
  $_truststore_password = if $truststore_password =~ String { Sensitive($truststore_password) } else { $truststore_password }

  Anchor <| title == 'candlepin::repo' |> ->
  class { 'candlepin::install': } ~>
  class { 'candlepin::config': } ~>
  class { 'candlepin::artemis': } ~>
  class { "candlepin::database::${candlepin::db_type}": } ~>
  Class['candlepin::service']
}
