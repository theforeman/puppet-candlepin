# Candlepin params
#
# @api private
class candlepin::params {
  $ssl_port = 8443

  $manage_db = true
  $init_db = true
  $db_type = 'postgresql'
  $db_host = 'localhost'
  $db_user = 'candlepin'
  $db_name = 'candlepin'
  $db_port = undef
  $db_ssl  = false
  $db_ssl_verify = true

  # this comes from keystore
  $db_password = extlib::cache_data('foreman_cache_data', 'candlepin_db_password', extlib::random_password(32))

  $keystore_file = 'conf/keystore'
  $keystore_password = undef
  $keystore_type = 'PKCS12'
  $truststore_file = 'conf/keystore'
  $truststore_password = undef

  $amq_enable = false
  $amqp_keystore_password = undef
  $amqp_truststore_password = undef
  $amqp_keystore = '/etc/candlepin/certs/amqp/candlepin.jks'
  $amqp_truststore = '/etc/candlepin/certs/amqp/candlepin.truststore'

  # where to store output from cpsetup execution
  $log_dir  = '/var/log/candlepin'

  $crl_file = '/var/lib/candlepin/candlepin-crl.crl'

  $oauth_key = 'candlepin'
  $oauth_secret = 'candlepin'

  $ca_key = '/etc/candlepin/certs/candlepin-ca.key'
  $ca_cert = '/etc/candlepin/certs/candlepin-ca.crt'
  $ca_key_password = undef

  $user_groups = []

  $env_filtering_enabled = true

  $qpid_hostname = 'localhost'
  $qpid_ssl_port = 5671
  $qpid_ssl_cert = undef
  $qpid_ssl_key = undef

  $ciphers = [
    'SSL_RSA_WITH_3DES_EDE_CBC_SHA',
    'TLS_RSA_WITH_AES_256_CBC_SHA',
    'TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA',
    'TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA',
    'TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA',
    'TLS_ECDH_RSA_WITH_AES_128_CBC_SHA',
    'TLS_ECDH_RSA_WITH_AES_256_CBC_SHA',
    'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA',
  ]

  $tls_versions = [
    '1.1',
    '1.2',
  ]

  $version = 'present'
  $wget_version = 'present'
  $run_init = false
  $adapter_module = undef
  $enable_hbm2ddl_validate = true

  $enable_basic_auth = true
  $enable_trusted_auth = false

  $consumer_system_name_pattern = undef

  $candlepin_conf_file = '/etc/candlepin/candlepin.conf'

  $manage_repo = false
  $repo_version = 'latest'
  $repo_yumcode = "el${::operatingsystemmajrelease}"
  $repo_gpgcheck = false
  $repo_gpgkey = undef

  # tomcat.conf paramaters
  $tomcat_base = '/var/lib/tomcats/'
  $java_home = '/usr/lib/jvm/jre'
  $catalina_home = '/usr/share/tomcat'
  $catalina_tmpdir = '/var/cache/tomcat/temp'
  $java_opts = '-Xms1024m -Xmx4096m'
  $lang = undef
  $security_manager = false
  $shutdown_wait = undef
}
