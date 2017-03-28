# Install and Configure candlepin
#
# == Parameters:
#
# $oauth_key::                    The OAuth key for talking to the candlepin API
#                                 type:String
#
# $oauth_secret::                 The OAuth secret for talking to the candlepin API
#                                 type:String
#
# $manage_db::                    Whether a database should be installed, this includes db creation and user
#                                 type:Boolean
#
# $init_db::                      Whether a database should be initialised.
#                                 type:Boolean
#
# $db_type::                      The type of database Candlepin will be connecting too.
#                                 type:Enum['postgresql','mysql']
#
# $db_host::                      Hostname of database server.
#                                 type:String
#
# $db_port::                      Port the database listens on. Only needs to be provided if different
#                                 from standard port of the :db_type.
#                                 type:Optional[Integer[0, 65535]]
#
# $db_name::                      The name of the Candlepin database
#                                 type:String
#
# $db_user::                      The Candlepin database username
#                                 type:String
#
# $db_password::                  The Candlepin database password
#                                 type:String
#
# $db_extraparams::               Extra parameters for the database connection (ex: ?sslmode=require to enable ssl on postgresql)
#                                 type:String
#
# $tomcat::                       The system tomcat to use, tomcat6 on RHEL6 and tomcat on most Fedoras
#                                 type:Enum['tomcat', 'tomcat6']
#
# $crl_file::                     The Certificate Revocation File for Candlepin
#                                 type:Stdlib::Absolutepath
#
# $user_groups::                  The user groups for the Candlepin tomcat user
#                                 type:Array
#
# $log_dir::                      Directory for Candlepin logs
#                                 type:Stdlib::Absolutepath
#
# $deployment_url::               The root URL to deploy the Web and API URLs at
#                                 type:Stdlib::HTTPUrl
#
# $weburl::                       The Candlepin Web URL which is configurable via the deployment_url
#                                 type:Stdlib::HTTPUrl
#
# $apiurl::                       The Candlepin API URL which is configurable via the deployment_url
#                                 type:Stdlib::HTTPUrl
#
# $env_filtering_enabled::        If subscription filtering is done on a per environment basis
#                                 type:Boolean
#
# $thumbslug_enabled::            If using Thumbslug
#                                 type:Boolean
#
# $thumbslug_oauth_key::          The OAuth key for talking to Thumbslug
#                                 type:String
#
# $thumbslug_oauth_secret::       The OAuth secret for talking to Thumbslug
#                                 type:String
#
# $keystore_file::                Tomcat keystore file to use
#                                 type:Stdlib::Absolutepath
#
# $keystore_password::            Password for keystore being used with Tomcat
#                                 type:String
#
# $keystore_type::                Keystore type
#                                 type:String
#
# $truststore_file::              Tomcat truststore file to use
#                                 type:Stdlib::Absolutepath
#
# $truststore_password::          Password for truststore being used with Tomcat
#                                 type:String
#
# $ca_key::                       CA key file to use
#                                 type:Stdlib::Absolutepath
#
# $ca_cert::                      CA certificate file to use
#                                 type:Stdlib::Absolutepath
#
# $ca_key_password::              CA key password
#                                 type:String
#
# $qpid_hostname::                The qpid server's hostname
#                                 type:String
#
# $qpid_ssl_port::                The qpid server's SSL port
#                                 type:Integer
#
# $version::                      Version of Candlepin to install
#                                 type:String
#
# $wget_version::                 Version of wget to install
#                                 type:String
#
# $run_init::                     If the init api should be called on Candlepin
#                                 type:Boolean
#
# $adapter_module::               Candlepin adapter implementations to inject into the java runtime
#                                 type:String
#
# $amq_enable::                   If amq should be enabled and configured
#                                 type:Boolean
#
# $amqp_keystore::                Location of the amqp keystore to use
#                                 type:Stdlib::Absolutepath
#
# $amqp_keystore_password::       Password for the amqp keystore
#                                 type:String
#
# $amqp_truststore::              Location of the amqp truststore to use
#                                 type:Stdlib::Absolutepath
#
# $amqp_truststore_password::     Password for the amqp trusture
#                                 type:String
#
#
# $enable_basic_auth::            Whether to enable HTTP basic auth
#                                 type:Boolean
#
# $enable_trusted_auth::          Whether to enable trusted auth
#                                 type:Boolean
#
# $consumer_system_name_pattern:: Regex that consistutes a valid consumer name
#                                 type:String
#
# $enable_hbm2ddl_validate::      If true will perform a schema check to ensure compliance with the models.
#                                 Disabling this feature may be required if modifications are required to
#                                 the schema.
#                                 type:Boolean
#
# $ssl_port::                     Port to deploy SSL enabled Tomcat server on
#                                 type:Integer[0, 65535]
#
# $candlepin_conf_file::          Configuration file location for candlepin
#                                 type:Stdlib::Absolutepath
#
class candlepin (
  $manage_db                    = $::candlepin::params::manage_db,
  $init_db                      = $::candlepin::params::init_db,
  $db_type                      = $::candlepin::params::db_type,
  $db_host                      = $::candlepin::params::db_host,
  $db_port                      = $::candlepin::params::db_port,
  $db_name                      = $::candlepin::params::db_name,
  $db_user                      = $::candlepin::params::db_user,
  $db_password                  = $::candlepin::params::db_password,
  $db_extraparams               = $::candlepin::params::db_extraparams,

  $tomcat                       = $::candlepin::params::tomcat,

  $crl_file                     = $::candlepin::params::crl_file,

  $user_groups                  = $::candlepin::params::user_groups,

  $log_dir                      = $::candlepin::params::log_dir,

  $oauth_key                    = $::candlepin::params::oauth_key,
  $oauth_secret                 = $::candlepin::params::oauth_secret,

  $deployment_url               = $::candlepin::params::deployment_url,

  $env_filtering_enabled        = $::candlepin::params::env_filtering_enabled,

  $thumbslug_enabled            = $::candlepin::params::thumbslug_enabled,
  $thumbslug_oauth_key          = $::candlepin::params::thumbslug_oauth_key,
  $thumbslug_oauth_secret       = $::candlepin::params::thumbslug_oauth_secret,

  $keystore_file                = $::candlepin::params::keystore_file,
  $keystore_password            = $::candlepin::params::keystore_password,
  $keystore_type                = $::candlepin::params::keystore_type,
  $truststore_file              = $::candlepin::params::truststore_file,
  $truststore_password          = $::candlepin::params::truststore_password,

  $amqp_keystore                = $::candlepin::params::amqp_keystore,
  $amqp_keystore_password       = $::candlepin::params::amqp_keystore_password,
  $amqp_truststore              = $::candlepin::params::amqp_truststore,
  $amqp_truststore_password     = $::candlepin::params::amqp_truststore_password,

  $ca_key                       = $::candlepin::params::ca_key,
  $ca_cert                      = $::candlepin::params::ca_cert,
  $ca_key_password              = $::candlepin::params::ca_key_password,
  $qpid_hostname                = $::candlepin::params::qpid_hostname,
  $qpid_ssl_port                = $::candlepin::params::qpid_ssl_port,

  $version                      = $::candlepin::params::version,
  $wget_version                 = $::candlepin::params::wget_version,
  $run_init                     = $::candlepin::params::run_init,
  $adapter_module               = $::candlepin::params::adapter_module,
  $amq_enable                   = $::candlepin::params::amq_enable,
  $enable_hbm2ddl_validate      = $::candlepin::params::enable_hbm2ddl_validate,

  $enable_basic_auth            = $::candlepin::params::enable_basic_auth,
  $enable_trusted_auth          = $::candlepin::params::enable_trusted_auth,
  $consumer_system_name_pattern = $::candlepin::params::consumer_system_name_pattern,

  $ssl_port                     = $::candlepin::params::ssl_port,

  $candlepin_conf_file          = $::candlepin::params::candlepin_conf_file,
) inherits candlepin::params {

  validate_bool($amq_enable)

  if $amq_enable {
    validate_absolute_path($amqp_keystore)
    validate_absolute_path($amqp_truststore)
    validate_string($amqp_keystore_password)
    validate_string($amqp_truststore_password)
  }

  validate_absolute_path($ca_key)
  validate_absolute_path($ca_cert)
  if $keystore_password {
    validate_string($keystore_password)
  }
  if $truststore_password {
    validate_string($truststore_password)
  }

  $weburl = "https://${::fqdn}/${candlepin::deployment_url}/distributors?uuid="
  $apiurl = "https://${::fqdn}/${candlepin::deployment_url}/api/distributors/"
  $amqpurl = "tcp://${qpid_hostname}:${qpid_ssl_port}?ssl='true'&ssl_cert_alias='amqp-client'"

  class { '::candlepin::install': } ~>
  class { '::candlepin::config':  } ~>
  class { '::candlepin::database': } ~>
  class { '::candlepin::service': } ~>
  Class['candlepin']

}
