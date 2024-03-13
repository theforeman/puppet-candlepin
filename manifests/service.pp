# Candlepin Service and Initialization
#
# @api private
class candlepin::service {
  assert_private()

  if $candlepin::use_container {
    $container_context = {
      'image' => $candlepin::container_image,
    }

    file { '/etc/containers/systemd/tomcat.container':
      ensure  => file,
      content => epp('candlepin/candlepin.container.epp', $container_context),
      owner   => 'root',
      group   => 'root',
      mode    => '0440',
      before  => Service['tomcat'],
    }
  }

  service { 'tomcat':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
