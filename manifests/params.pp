# Candlepin params
#
# @api private
class candlepin::params {
  # this comes from keystore
  $db_password = extlib::cache_data('foreman_cache_data', 'candlepin_db_password', extlib::random_password(32))
}
