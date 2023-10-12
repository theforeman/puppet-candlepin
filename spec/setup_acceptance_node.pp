$major = $facts['os']['release']['major']

package { 'glibc-langpack-en':
  ensure => installed,
}

class { 'candlepin::repo':
  version => pick(fact('candlepin_version'), 'nightly'),
}

if $facts['os']['selinux']['enabled'] {
  # Workaround for https://github.com/theforeman/puppet-candlepin/issues/188
  package { 'pki-core':
    # enable_only is required as workaround for https://tickets.puppetlabs.com/browse/PUP-11024
    enable_only => true,
    ensure      => present,
    provider    => 'dnfmodule',
    before      => Package['candlepin-selinux'],
  }
}

# Needed as a workaround for idempotency
if $facts['os']['selinux']['enabled'] {
  package { 'candlepin-selinux':
    ensure  => installed,
    require => Yumrepo['candlepin'],
  }
}

# Used to test which TLS versions are enabled
package { 'nmap':
  ensure => installed,
}
