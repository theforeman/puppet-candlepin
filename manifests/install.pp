# Candlepin installation packages
#
# @api private
class candlepin::install {
  assert_private()

  package { ['candlepin']:
    ensure => $candlepin::version,
  }

  if $facts['selinux'] {
    package { ['candlepin-selinux']:
      ensure => $candlepin::version,
    }
  }

  if $candlepin::run_init {
    ensure_packages(['wget'], { ensure => $candlepin::wget_version, })
  }
}
