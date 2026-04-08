# Configuration for Artemis
#
# @api private
class candlepin::artemis {
  assert_private()

  file { '/etc/candlepin/broker.xml':
    ensure => absent,
  }

  file { "${candlepin::tomcat_conf}/login.config":
    ensure => absent,
  }

  file { "${candlepin::tomcat_conf}/cert-users.properties":
    ensure => absent,
  }

  file { "${candlepin::tomcat_conf}/cert-roles.properties":
    ensure => absent,
  }

  file { "${candlepin::tomcat_conf}/conf.d/jaas.conf":
    ensure => absent,
  }
}
