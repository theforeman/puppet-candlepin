# Qpid setup for Candlepin
#
# @api private
class candlepin::qpid {
  assert_private()

  if $candlepin::amq_enable {
    qpid::config::exchange { 'event':
      exchange => 'event',
      hostname => $candlepin::qpid_hostname,
      port     => $candlepin::qpid_ssl_port,
      ssl_cert => $candlepin::qpid_ssl_cert,
      ssl_key  => $candlepin::qpid_ssl_key,
    }
  }

}
