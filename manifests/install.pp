# Candlepin installation packages
#
# @api private
class candlepin::install {
  assert_private()

  if $candlepin::java_package {
    stdlib::ensure_packages([$candlepin::java_package])
    Package[$candlepin::java_package] -> Package['candlepin']
  }

  package { ['candlepin']:
    ensure => $candlepin::version,
  }

  if $facts['os']['selinux']['enabled'] {
    package { ['candlepin-selinux']:
      ensure => $candlepin::version,
    }
  }
}
