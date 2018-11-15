# Candlepin installation packages
#
# @api private
class candlepin::install {
  assert_private()

  if $candlepin::container {
    ensure_packages(['podman'])

    exec { 'pull candlepin image':
      command => "/usr/bin/podman pull ${candlepin::container_image}:${candlepin::container_version}",
      unless  => "/usr/bin/podman images ${candlepin::container_image}:${candlepin::container_version}",
      require => Package['podman'],
      timeout => 600,
    }
  } else {
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
}
