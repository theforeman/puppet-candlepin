class { 'candlepin::repo':
  version => pick(fact('candlepin_version'), 'nightly'),
  baseurl => fact('candlepin_baseurl'),
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
