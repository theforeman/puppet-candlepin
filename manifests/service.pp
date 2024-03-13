# Candlepin Service and Initialization
#
# @api private
class candlepin::service {
  assert_private()

  if $candlepin::use_container {
    file { '/etc/containers/systemd/tomcat.container':
      ensure  => file,
      content => template('candlepin/candlepin.container'),
      owner   => 'root',
      group   => 'root',
      mode    => '0444',
      before  => Service['tomcat'],
    }
  }

  service { 'tomcat':
    ensure   => 'running',
    enable   => true,
    restart  => true,
    provider => 'systemd',
  }
}
