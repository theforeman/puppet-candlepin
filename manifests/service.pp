# Candlepin Service and Initialization
#
# @api private
class candlepin::service {
  assert_private()

  if $candlepin::use_container {
    $container_context = {
      'image' => $candlepin::container_image,
    }

    file { '/etc/containers/systemd/candlepin.yaml':
      ensure  => file,
      content => template('candlepin/candlepin.yaml.epp', $container_context),
      owner   => 'root',
      group   => 'root',
      mode    => '0444',
      before  => Service['tomcat'],
    }

    file { '/etc/containers/systemd/tomcat.kube':
      ensure  => file,
      content => template('candlepin/tomcat.kube'),
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
