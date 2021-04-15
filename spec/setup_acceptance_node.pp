$major = $facts['os']['release']['major']

if $major == '8' {
  package { 'glibc-langpack-en':
    ensure => installed,
  }
}

# Defaults to staging, for release, use
# $baseurl = "https://yum.theforeman.org/katello/nightly/candlepin/el${major}/x86_64/"
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
