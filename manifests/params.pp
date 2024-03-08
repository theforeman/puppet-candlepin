# Candlepin params
#
# @api private
class candlepin::params {
  # this comes from keystore
  $db_password = Sensitive(extlib::cache_data('foreman_cache_data', 'candlepin_db_password', extlib::random_password(32)))

  $ciphers = [
    'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384',
    'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384',
    'TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384',
    'TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384',
    'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256',
    'TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256',
    'TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256',
    'TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256',
  ]
}
