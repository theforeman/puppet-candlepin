# Candlepin installation packages
#
# @api private
class candlepin::install {
  assert_private()

  package { ['candlepin']:
    ensure => $candlepin::version,
  }

  ensure_packages(['wget'], { ensure => $candlepin::wget_version, })
}
