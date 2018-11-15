# Candlepin Service and Initialization
#
# @api private
class candlepin::service {
  assert_private()

  if $candlepin::container {
    file { '/etc/sysconfig/candlepin':
      ensure  => file,
      content => template('candlepin/candlepin.sysconfig.erb'),
      notify  => Service[$candlepin::service_name],
      mode    => '0640',
    }

    systemd::unit_file { 'candlepin.service':
      content => template('candlepin/candlepin.service.erb'),
      notify  => Service[$candlepin::service_name],
    }
  }

  service { $candlepin::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  if $candlepin::run_init {
    exec { 'cpinit':
      # tomcat startup is slow - try multiple times (the initialization service is idempotent)
      command => "/usr/bin/wget --no-check-certificate --no-proxy --timeout=30 --tries=40 --wait=20 --retry-connrefused -qO- https://localhost:${candlepin::ssl_port}/candlepin/admin/init > /var/log/candlepin/cpinit.log 2>&1 && touch /var/lib/candlepin/cpinit_done",
      require => [Package['wget'], Service[$candlepin::service_name]],
      creates => '/var/lib/candlepin/cpinit_done',
      # timeout is roughly "wait" * "tries" from above
      timeout =>  800,
    }
  }

}
