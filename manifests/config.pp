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

  file { '/etc/tomcat/server.xml':
    ensure  => file,
    content => template('candlepin/tomcat/server.xml.erb'),
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
