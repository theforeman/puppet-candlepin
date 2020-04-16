#
# Create certificates then install candlepin
#

$keydir = '/etc/candlepin/certs'
$keystore = "${keydir}/keystore"
$keystore_password = 'secret'
$ca_key = "${keydir}/candlepin-ca.key"
$ca_cert = "${keydir}/candlepin-ca.crt"

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
exec { 'Create keystore':
  command => "/usr/bin/openssl pkcs12 -export -in '${ca_cert}' -inkey '${ca_key}' -out '${keystore}' -name tomcat -CAfile '${ca_cert}' -caname root -password 'pass:${keystore_password}'",
  creates => $keystore,
  notify  => Service['tomcat'],
} ->
package { ['java']: } ->
exec { 'add ca cert':
  command => "/usr/bin/keytool -import -trustcacerts -v -keystore /etc/candlepin/certs/keystore -storepass ${keystore_password} -alias candlepin-ca -file /etc/candlepin/certs/candlepin-ca.crt -noprompt",
  unless  => "/usr/bin/keytool -list -keystore ${keystore} -storepass ${keystore_password} -alias candlepin-ca | grep $(openssl x509 -noout -fingerprint -in ${ca_cert} | cut -d '=' -f 2)",
} ->
group { 'tomcat': } ->
file { $ca_key:
  mode  => '0440',
  group => 'tomcat',
} ->
file { $ca_cert:
  mode  => '0440',
  group => 'tomcat',
} ->
file { $keystore:
  mode  => '0440',
  group => 'tomcat',
} ->
class { 'candlepin':
  ca_key              => $ca_key,
  ca_cert             => $ca_cert,
  keystore_file       => $keystore,
  keystore_password   => $keystore_password,
  truststore_password => $keystore_password,
}
