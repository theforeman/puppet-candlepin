# Candlepin installation packages
#
# @api private
class candlepin::install {
  assert_private()

  $enable_pki_core = $facts['os']['release']['major'] == '8'

  if $candlepin::java_package {
    stdlib::ensure_packages([$candlepin::java_package])
    Package[$candlepin::java_package] -> Package['candlepin']
  }

  if $enable_pki_core {
    package { 'pki-core':
      ensure      => installed,
      enable_only => true,
      provider    => 'dnfmodule',
      before      => Package['candlepin'],
    }
  }

  package { ['candlepin']:
    ensure => $candlepin::version,
  }

  if $facts['os']['selinux']['enabled'] {
    package { ['candlepin-selinux']:
      ensure => $candlepin::version,
    }

    if $enable_pki_core {
      Package['pki-core'] -> Package['candlepin-selinux']
    }
  }

  if $candlepin::run_init {
    stdlib::ensure_packages(['wget'], { ensure => $candlepin::wget_version, })
  }
}
