# Configuration for Candlepin
#
# @api private
class candlepin::config {
  assert_private()

  user { $candlepin::user:
    ensure => present,
    gid    => $candlepin::group,
    groups => $candlepin::user_groups,
  }

  group { $candlepin::group:
    ensure => present,
  }

  $candlepin_context = {
    'module_name'                  => $module_name,
    'adapter_module'               => $candlepin::adapter_module,
    'broker_config_file'           => $candlepin::broker_config_file,
    'ca_cert'                      => $candlepin::ca_cert,
    'ca_key'                       => $candlepin::ca_key,
    'ca_key_password'              => $candlepin::_ca_key_password,
    'consumer_system_name_pattern' => $candlepin::consumer_system_name_pattern,
    'enable_basic_auth'            => $candlepin::enable_basic_auth,
    'enable_trusted_auth'          => $candlepin::enable_trusted_auth,
    'env_filtering_enabled'        => $candlepin::env_filtering_enabled,
    'expired_pools_schedule'       => $candlepin::expired_pools_schedule,
    'loggers'                      => $candlepin::loggers,
    'oauth_key'                    => $candlepin::_oauth_key,
    'oauth_secret'                 => $candlepin::_oauth_secret,
    'db_manage_on_startup'         => $candlepin::db_manage_on_startup,
  }

  concat::fragment { 'General Config':
    target  => $candlepin::candlepin_conf_file,
    content => epp('candlepin/candlepin.conf.epp', $candlepin_context),
  }

  concat { $candlepin::candlepin_conf_file:
    mode  => '0640',
    owner => 'root',
    group => $candlepin::group,
  }

  $server_context = {
    'module_name'         => $module_name,
    'host'                => $candlepin::host,
    'ssl_port'            => $candlepin::ssl_port,
    'ciphers'             => $candlepin::ciphers,
    'tls_versions'        => $candlepin::tls_versions,
    'keystore_file'       => $candlepin::keystore_file,
    'keystore_password'   => $candlepin::_keystore_password,
    'keystore_type'       => $candlepin::keystore_type,
    'truststore_file'     => $candlepin::truststore_file,
    'truststore_password' => $candlepin::_truststore_password,
  }

  file { "${candlepin::tomcat_conf}/server.xml":
    ensure  => file,
    content => epp('candlepin/tomcat/server.xml.epp', $server_context),
    mode    => '0640',
    owner   => 'root',
    group   => $candlepin::group,
  }

  file { "${candlepin::tomcat_conf}/tomcat.conf":
    ensure  => file,
    content => template('candlepin/tomcat/tomcat.conf.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => $candlepin::group,
  }

  # Cleans up an artifact leftover from the removal of cpdb_create
  # This can be removed in Foreman 3.13
  file { '/var/lib/candlepin/.puppet-candlepin-rpm-version':
    ensure => absent,
  }
}
