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

  concat::fragment { 'General Config':
    target  => $candlepin::candlepin_conf_file,
    content => template('candlepin/candlepin.conf.erb'),
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

  file { '/etc/tomcat/server.xml':
    ensure  => file,
    content => epp('candlepin/tomcat/server.xml.epp', $server_context),
    mode    => '0640',
    owner   => 'root',
    group   => $candlepin::group,
  }

  file { '/etc/tomcat/tomcat.conf':
    ensure  => file,
    content => template('candlepin/tomcat/tomcat.conf.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => $candlepin::group,
  }
}
