$major = $facts['os']['release']['major']

if $major == '8' {
  # https://tickets.puppetlabs.com/browse/PUP-9978
  exec { '/usr/bin/dnf -y module enable pki-core':
  }

  package { 'glibc-langpack-en':
    ensure => installed,
  }
}

# Defaults to staging, for release, use
# $baseurl = "https://fedorapeople.org/groups/katello/releases/yum/nightly/candlepin/el${major}/x86_64/"
$baseurl = "http://koji.katello.org/releases/yum/katello-nightly/candlepin/el${major}/x86_64/"

yumrepo { 'candlepin':
  baseurl  => $baseurl,
  gpgcheck => 0,
}

# Needed as a workaround for idempotency
if $facts['os']['selinux']['enabled'] {
  package { 'candlepin-selinux':
    ensure  => installed,
    require => Yumrepo['candlepin'],
  }
}
