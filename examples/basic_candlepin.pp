#
# Create certificates then install candlepin
#

$keydir = '/etc/candlepin/certs'
$ca_key = "${keydir}/candlepin-ca.key"
$ca_cert = "${keydir}/candlepin-ca.crt"
$certificate_file = "${keydir}/tomcat.crt"
$certificate_key_file = "${keydir}/tomcat.key"

exec { "/bin/mkdir -p ${keydir}":
  creates => $keydir,
} ->
exec { 'Create CA key':
  command => "/usr/bin/openssl genrsa -out '${ca_key}' 2048",
  creates => $ca_key,
  notify  => Service['tomcat'],
} ->
exec { 'Create CA certficate':
  command => "/usr/bin/openssl req -new -x509 -key '${ca_key}' -out '${ca_cert}' -nodes -x509 -subj '/C=US/ST=North Carolina/L=Raleigh/O=CustomKatelloCA/CN=${facts['networking']['fqdn']}'",
  creates => $ca_cert,
  notify  => Service['tomcat'],
} ->
exec { 'Create server key':
  command => "/usr/bin/openssl genrsa -out '${certificate_key_file}' 2048",
  creates => $certificate_key_file,
  notify  => Service['tomcat'],
} ->
exec { 'Create server certificate':
  command => "/usr/bin/openssl req -new -key '${certificate_key_file}' -out '${keydir}/tomcat.csr' -subj '/C=US/ST=North Carolina/L=Raleigh/O=Candlepin/CN=${facts['networking']['fqdn']}' && /usr/bin/openssl x509 -req -in '${keydir}/tomcat.csr' -CA '${ca_cert}' -CAkey '${ca_key}' -CAcreateserial -out '${certificate_file}' -days 3650",
  creates => $certificate_file,
  notify  => Service['tomcat'],
} ->
file { $ca_key:
  mode  => '0440',
  group => 'tomcat',
} ->
file { $ca_cert:
  mode  => '0440',
  group => 'tomcat',
} ->
file { $certificate_file:
  mode  => '0440',
  group => 'tomcat',
} ->
file { $certificate_key_file:
  mode  => '0440',
  group => 'tomcat',
} ->
class { 'candlepin':
  ca_key               => $ca_key,
  ca_cert              => $ca_cert,
  certificate_file     => $certificate_file,
  certificate_key_file => $certificate_key_file,
  java_package         => 'java-25-openjdk',
  java_home            => '/usr/lib/jvm/jre-25',
}
