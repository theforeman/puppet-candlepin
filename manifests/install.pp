# Candlepin installation packages
class candlepin::install {
  package { ['candlepin', "candlepin-${candlepin::tomcat}"]:
    ensure => $candlepin::version,
  }

  ensure_packages(['wget'], { ensure => $candlepin::wget_version, })
}
