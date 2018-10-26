# Install and Configure candlepin
#
# == Parameters:
#
# $oauth_key::                    The OAuth key for talking to the candlepin API
#
# $oauth_secret::                 The OAuth secret for talking to the candlepin API
#
# $manage_db::                    Whether a database should be installed, this includes db creation and user
#
# $init_db::                      Whether a database should be initialised.
#
# $db_type::                      The type of database Candlepin will be connecting too.
#
# $db_host::                      Hostname of database server.
#
# $db_port::                      Port the database listens on. Only needs to be provided if different
#                                 from standard port of the :db_type.
#
# $db_ssl::                       Boolean indicating if the connection to the database should be over
#                                 an SSL connection.
#
# $db_ssl_verify::                Boolean indicating if the SSL connection to the database should be verified
#
# $db_name::                      The name of the Candlepin database
#
# $db_user::                      The Candlepin database username
#
# $db_password::                  The Candlepin database password
#
# $crl_file::                     The Certificate Revocation File for Candlepin
#
# $user_groups::                  The user groups for the Candlepin tomcat user
#
# $log_dir::                      Directory for Candlepin logs
#
# $env_filtering_enabled::        If subscription filtering is done on a per environment basis
#
# $keystore_file::                Tomcat keystore file to use
#
# $keystore_password::            Password for keystore being used with Tomcat
#
# $keystore_type::                Keystore type
#
# $truststore_file::              Tomcat truststore file to use
#
# $truststore_password::          Password for truststore being used with Tomcat
#
# $ca_key::                       CA key file to use
#
# $ca_cert::                      CA certificate file to use
#
# $ca_key_password::              CA key password
#
# $qpid_hostname::                The qpid server's hostname
#
# $qpid_ssl_port::                The qpid server's SSL port
#
# $qpid_ssl_cert::                Client certificate to talk to qpid server
#
# $qpid_ssl_key::                 Client key to talk to qpid server
#
# $ciphers::                      Allowed ciphers for ssl connection. Array of strings
#
# $tls_versions::                 Allowed versions of TLS, for example 1.1, 1.2, etc
#
# $version::                      Version of Candlepin to install
#
# $wget_version::                 Version of wget to install
#
# $run_init::                     If the init api should be called on Candlepin
#
# $adapter_module::               Candlepin adapter implementations to inject into the java runtime
#
# $amq_enable::                   If amq should be enabled and configured
#
# $amqp_keystore::                Location of the amqp keystore to use
#
# $amqp_keystore_password::       Password for the amqp keystore
#
# $amqp_truststore::              Location of the amqp truststore to use
#
# $amqp_truststore_password::     Password for the amqp trusture
#
#
# $enable_basic_auth::            Whether to enable HTTP basic auth
#
# $enable_trusted_auth::          Whether to enable trusted auth
#
# $consumer_system_name_pattern:: Regex that consistutes a valid consumer name
#
# $enable_hbm2ddl_validate::      If true will perform a schema check to ensure compliance with the models.
#                                 Disabling this feature may be required if modifications are required to
#                                 the schema.
#
# $ssl_port::                     Port to deploy SSL enabled Tomcat server on
#
# $candlepin_conf_file::          Configuration file location for candlepin
#
# $manage_repo::                  Whether to manage the yum repository
#
# $repo_version::                 Which yum repository to install. For example
#                                 latest or 3.3. Note that the versions are
#                                 Katello releases.
#
# $repo_gpgcheck::                Whether to check the GPG signatures
#
# $repo_gpgkey::                  The GPG key to use
#
# === Advanced parameters:
#
# $tomcat_base::                  In new-style instances, if CATALINA_BASE isn't specified, it will be constructed by joining TOMCATS_BASE and NAME.
#
# $java_home::                    Where your java installation lives
#
# $catalina_home::                Where your tomcat installation lives
#
# $catalina_tmpdir::              System-wide tmp
#
# $java_opts::                    Java Parameters
#
# $lang::                         Tomcat locale setting
#
# $security_manager::             Run tomcat under the Java Security Manager
#
# $shutdown_wait::                Time to wait in seconds, before killing process
#
class candlepin (
  Boolean $manage_db = $::candlepin::params::manage_db,
  Boolean $init_db = $::candlepin::params::init_db,
  Enum['postgresql','mysql'] $db_type = $::candlepin::params::db_type,
  String $db_host = $::candlepin::params::db_host,
  Optional[Integer[0, 65535]] $db_port = $::candlepin::params::db_port,
  Boolean $db_ssl = $::candlepin::params::db_ssl,
  Boolean $db_ssl_verify = $::candlepin::params::db_ssl_verify,
  String $db_name = $::candlepin::params::db_name,
  String $db_user = $::candlepin::params::db_user,
  String $db_password = $::candlepin::params::db_password,
  Stdlib::Absolutepath $crl_file = $::candlepin::params::crl_file,
  Variant[Array[String], String] $user_groups = $::candlepin::params::user_groups,
  Stdlib::Absolutepath $log_dir = $::candlepin::params::log_dir,
  String $oauth_key = $::candlepin::params::oauth_key,
  String $oauth_secret = $::candlepin::params::oauth_secret,
  Boolean $env_filtering_enabled = $::candlepin::params::env_filtering_enabled,
  String $keystore_file = $::candlepin::params::keystore_file,
  Optional[String] $keystore_password = $::candlepin::params::keystore_password,
  String $keystore_type = $::candlepin::params::keystore_type,
  String $truststore_file = $::candlepin::params::truststore_file,
  Optional[String] $truststore_password = $::candlepin::params::truststore_password,
  Stdlib::Absolutepath $amqp_keystore = $::candlepin::params::amqp_keystore,
  Optional[String] $amqp_keystore_password = $::candlepin::params::amqp_keystore_password,
  Stdlib::Absolutepath $amqp_truststore = $::candlepin::params::amqp_truststore,
  Optional[String] $amqp_truststore_password = $::candlepin::params::amqp_truststore_password,
  Stdlib::Absolutepath $ca_key = $::candlepin::params::ca_key,
  Stdlib::Absolutepath $ca_cert = $::candlepin::params::ca_cert,
  Optional[String] $ca_key_password = $::candlepin::params::ca_key_password,
  String $qpid_hostname = $::candlepin::params::qpid_hostname,
  Integer[0,65535] $qpid_ssl_port = $::candlepin::params::qpid_ssl_port,
  Optional[Stdlib::Absolutepath] $qpid_ssl_cert = $::candlepin::params::qpid_ssl_cert,
  Optional[Stdlib::Absolutepath] $qpid_ssl_key = $::candlepin::params::qpid_ssl_key,
  Array[String] $ciphers = $::candlepin::params::ciphers,
  Array[String] $tls_versions = $::candlepin::params::tls_versions,
  String $version = $::candlepin::params::version,
  String $wget_version = $::candlepin::params::wget_version,
  Boolean $run_init = $::candlepin::params::run_init,
  Optional[String] $adapter_module = $::candlepin::params::adapter_module,
  Boolean $amq_enable = $::candlepin::params::amq_enable,
  Boolean $enable_hbm2ddl_validate = $::candlepin::params::enable_hbm2ddl_validate,
  Boolean $enable_basic_auth = $::candlepin::params::enable_basic_auth,
  Boolean $enable_trusted_auth = $::candlepin::params::enable_trusted_auth,
  Optional[String] $consumer_system_name_pattern = $::candlepin::params::consumer_system_name_pattern,
  Integer[0, 65535] $ssl_port = $::candlepin::params::ssl_port,
  Stdlib::Absolutepath $candlepin_conf_file = $::candlepin::params::candlepin_conf_file,
  Boolean $manage_repo = $::candlepin::params::manage_repo,
  String $repo_version = $::candlepin::params::repo_version,
  Boolean $repo_gpgcheck = $::candlepin::params::repo_gpgcheck,
  Optional[String] $repo_gpgkey = $::candlepin::params::repo_gpgkey,
  Stdlib::Absolutepath $tomcat_base = $::candlepin::params::tomcat_base,
  Stdlib::Absolutepath $java_home = $::candlepin::params::java_home,
  Stdlib::Absolutepath $catalina_home = $::candlepin::params::catalina_home,
  Stdlib::Absolutepath $catalina_tmpdir = $::candlepin::params::catalina_tmpdir,
  String $java_opts = $::candlepin::params::java_opts,
  Optional[String] $lang = $::candlepin::params::lang,
  Boolean $security_manager = $::candlepin::params::security_manager,
  Optional[Integer[0]] $shutdown_wait = $::candlepin::params::shutdown_wait,
) inherits candlepin::params {
  if $amq_enable {
    assert_type(String, $amqp_keystore_password)
    assert_type(String, $amqp_truststore_password)
  }

  $amqpurl = "tcp://${qpid_hostname}:${qpid_ssl_port}?ssl='true'&ssl_cert_alias='amqp-client'"

  contain ::candlepin::service

  class { '::candlepin::repo': } ->
  class { '::candlepin::install': } ~>
  class { '::candlepin::config':  } ~>
  class { "::candlepin::database::${::candlepin::db_type}": } ~>
  class { '::candlepin::qpid': } ~>
  Class['candlepin::service']

}
