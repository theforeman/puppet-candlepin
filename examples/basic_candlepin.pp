#
# Create certificates then install candlepin
#

Exec {
  path    => ['/usr/bin'],
  cwd     => '/etc/candlepin/certs/',
}

file { '/etc/candlepin/':
  ensure => directory,
}
file { '/etc/candlepin/certs/':
  ensure => directory,
} ->
exec { 'Create CA key':
  command => 'openssl genrsa -out candlepin-ca.key 2048',
  creates => '/etc/candlepin/certs/candlepin-ca.key',
  notify  => Service['tomcat'],
} ->
exec { 'Create CA certficates':
  command => 'openssl req -new -x509 -key candlepin-ca.key -out candlepin-ca.crt -nodes -x509 -subj "/C=US/ST=North Carolina/L=Raleigh/O=CustomKatelloCA/CN=www.candlepin.example.com"',
  creates => '/etc/candlepin/certs/candlepin-ca.crt',
  notify  => Service['tomcat'],
} ->
class { 'candlepin':
  manage_repo => true,
}
