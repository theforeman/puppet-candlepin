# Candlepin Service and Initialization
#
# @api private
class candlepin::service {
  assert_private()

  service { 'tomcat':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
