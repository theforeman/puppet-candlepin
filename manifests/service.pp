class candlepin::service {
  service {"${katello::params::tomcat}":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    start      => "/usr/sbin/service-wait ${katello::params::tomcat} start",
    stop       => "/usr/sbin/service-wait ${katello::params::tomcat} stop",
    restart    => "/usr/sbin/service-wait ${katello::params::tomcat} restart",
    status     => "/usr/sbin/service-wait ${katello::params::tomcat} status",
    require    => [
      Class["candlepin::config"],
      Class["postgres::service"],
      File[$certs::params::katello_keystore],
      File["/usr/share/${katello::params::tomcat}/conf/keystore"]
    ]
  }

  exec { "cpinit":
    # tomcat startup is slow - try multiple times (the initialization service is idempotent)
    command => "/usr/bin/wget --timeout=30 --tries=5 --retry-connrefused -qO- http://localhost:8080/candlepin/admin/init >${katello::params::configure_log_base}/cpinit.log 2>&1 && touch /var/lib/katello/cpinit_done",
    require => [ Service["${katello::params::tomcat}"], File["${katello::params::configure_log_base}"] ],
    creates => "/var/lib/katello/cpinit_done",
    before  => Class["apache2::service"],
  }
}
