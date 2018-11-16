# Configuration for Candlepin
#
# @api private
class candlepin::config {
  assert_private()

  user { 'tomcat':
    ensure => present,
    groups => $candlepin::user_groups,
  }

  concat::fragment { 'General Config':
    target  => $candlepin::candlepin_conf_file,
    content => template('candlepin/candlepin.conf.erb'),
  }

  concat{ $candlepin::candlepin_conf_file:
    mode  => '0600',
    owner => 'tomcat',
    group => 'tomcat',
  }

  file { '/etc/candlepin/certs/candlepin-ca.crt':
    ensure => file,
    source => $candlepin::ca_cert,
  }

  file { '/etc/candlepin/certs/candlepin-ca.key':
    ensure => file,
    source => $candlepin::ca_key,
  }

  file { '/etc/tomcat/server.xml':
    ensure  => file,
    content => template('candlepin/tomcat/server.xml.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  file { '/etc/tomcat/tomcat.conf':
    ensure  => file,
    content => template('candlepin/tomcat/tomcat.conf.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'tomcat',
  }
}
