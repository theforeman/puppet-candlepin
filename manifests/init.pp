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
#
# @param db_ssl
#   Boolean indicating if the connection to the database should be over an SSL
#   connection.
#
# @param db_ssl_verify
#   Boolean indicating if the SSL connection to the database should be verified
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
# @param crl_file
#   The Certificate Revocation File for Candlepin
#
# @param user_groups
#   The user groups for the Candlepin tomcat user
#
# @param log_dir
#   Directory for Candlepin logs
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
#   Tomcat truststore file to use
#
# @param truststore_password
#   Password for truststore being used with Tomcat
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
# @param wget_version
#   Version of wget to install
#
# @param run_init
#   If the init api should be called on Candlepin
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
# @param manage_repo
#   Whether to manage the yum repository
#
# @param repo_version
#   Which yum repository to install. For example latest or 3.3. Note that the
#   versions are Katello releases.
#
# @param repo_gpgcheck
#   Whether to check the GPG signatures
#
# @param repo_gpgkey
#   The GPG key to use
#
# @param tomcat_base
#   In new-style instances, if CATALINA_BASE isn't specified, it will be
#   constructed by joining TOMCATS_BASE and NAME.
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
# @param certificate_revocation_list_task_schedule
#   Quartz schedule notation for how often to run CRL generation
#
# @param artemis_port
#   Port to expose Artemis on
#
# @param artemis_host
#   Host address to have Artemis listen on; defaults to localhost
#
# @param artemis_client_dn
#   Full DN for the client certificate used to talk to Artemis
class candlepin (
  Boolean $manage_db = $candlepin::params::manage_db,
  Boolean $init_db = $candlepin::params::init_db,
  Enum['postgresql','mysql'] $db_type = $candlepin::params::db_type,
  String $db_host = $candlepin::params::db_host,
  Optional[Integer[0, 65535]] $db_port = $candlepin::params::db_port,
  Boolean $db_ssl = $candlepin::params::db_ssl,
  Boolean $db_ssl_verify = $candlepin::params::db_ssl_verify,
  String $db_name = $candlepin::params::db_name,
  String $db_user = $candlepin::params::db_user,
  String $db_password = $candlepin::params::db_password,
  Stdlib::Absolutepath $crl_file = $candlepin::params::crl_file,
  Variant[Array[String], String] $user_groups = $candlepin::params::user_groups,
  Stdlib::Absolutepath $log_dir = $candlepin::params::log_dir,
  String $oauth_key = $candlepin::params::oauth_key,
  String $oauth_secret = $candlepin::params::oauth_secret,
  Boolean $env_filtering_enabled = $candlepin::params::env_filtering_enabled,
  String $keystore_file = $candlepin::params::keystore_file,
  Optional[String] $keystore_password = $candlepin::params::keystore_password,
  String $keystore_type = $candlepin::params::keystore_type,
  String $truststore_file = $candlepin::params::truststore_file,
  Optional[String] $truststore_password = $candlepin::params::truststore_password,
  Stdlib::Absolutepath $ca_key = $candlepin::params::ca_key,
  Stdlib::Absolutepath $ca_cert = $candlepin::params::ca_cert,
  Optional[String] $ca_key_password = $candlepin::params::ca_key_password,
  Array[String] $ciphers = $candlepin::params::ciphers,
  Array[String] $tls_versions = $candlepin::params::tls_versions,
  String $version = $candlepin::params::version,
  String $wget_version = $candlepin::params::wget_version,
  Boolean $run_init = $candlepin::params::run_init,
  Optional[String] $adapter_module = $candlepin::params::adapter_module,
  Boolean $enable_hbm2ddl_validate = $candlepin::params::enable_hbm2ddl_validate,
  Boolean $enable_basic_auth = $candlepin::params::enable_basic_auth,
  Boolean $enable_trusted_auth = $candlepin::params::enable_trusted_auth,
  Optional[String] $consumer_system_name_pattern = $candlepin::params::consumer_system_name_pattern,
  Integer[0, 65535] $ssl_port = $candlepin::params::ssl_port,
  Stdlib::Host $host = $candlepin::params::host,
  Stdlib::Absolutepath $candlepin_conf_file = $candlepin::params::candlepin_conf_file,
  Boolean $manage_repo = $candlepin::params::manage_repo,
  String $repo_version = $candlepin::params::repo_version,
  Boolean $repo_gpgcheck = $candlepin::params::repo_gpgcheck,
  Optional[String] $repo_gpgkey = $candlepin::params::repo_gpgkey,
  Stdlib::Absolutepath $tomcat_base = $candlepin::params::tomcat_base,
  Stdlib::Absolutepath $java_home = $candlepin::params::java_home,
  Stdlib::Absolutepath $catalina_home = $candlepin::params::catalina_home,
  Stdlib::Absolutepath $catalina_tmpdir = $candlepin::params::catalina_tmpdir,
  String $java_opts = $candlepin::params::java_opts,
  Optional[String] $lang = $candlepin::params::lang,
  Boolean $security_manager = $candlepin::params::security_manager,
  Optional[Integer[0]] $shutdown_wait = $candlepin::params::shutdown_wait,
  String $expired_pools_schedule = $candlepin::params::expired_pools_schedule,
  Stdlib::Host $artemis_host = $candlepin::params::host,
  Stdlib::Port $artemis_port = $candlepin::params::artemis_port,
  String $artemis_client_dn = $candlepin::params::artemis_client_dn,
) inherits candlepin::params {

  contain candlepin::service

  class { 'candlepin::repo': } ->
  class { 'candlepin::install': } ~>
  class { 'candlepin::config':  } ~>
  class { 'candlepin::artemis':  } ~>
  class { "candlepin::database::${candlepin::db_type}": } ~>
  Class['candlepin::service']

}
