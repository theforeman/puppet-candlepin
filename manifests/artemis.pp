# Configuration for Artemis
#
# @api private
class candlepin::artemis {
  assert_private()

  file { $candlepin::broker_config_file:
    ensure  => file,
    content => template('candlepin/broker.xml.erb'),
    mode    => '0640',
    owner   => 'tomcat',
    group   => 'tomcat',
  }

  file { "${candlepin::catalina_home}/conf/login.config":
    ensure  => file,
    content => file('candlepin/tomcat/login.config'),
    mode    => '0640',
    owner   => 'tomcat',
    group   => 'tomcat',
  }

  file { "${candlepin::catalina_home}/conf/cert-users.properties":
    ensure  => file,
    content => template('candlepin/tomcat/cert-users.properties.erb'),
    mode    => '0640',
    owner   => 'tomcat',
    group   => 'tomcat',
  }

  file { "${candlepin::catalina_home}/conf/cert-roles.properties":
    ensure  => file,
    content => file('candlepin/tomcat/cert-roles.properties'),
    mode    => '0640',
    owner   => 'tomcat',
    group   => 'tomcat',
  }

  file { "${candlepin::catalina_home}/conf/conf.d/jaas.conf":
    ensure  => file,
    content => file('candlepin/tomcat/jaas.conf'),
    mode    => '0640',
    owner   => 'tomcat',
    group   => 'tomcat',
  }

  if $facts['os']['selinux']['enabled'] {
    selboolean { 'candlepin_can_bind_activemq_port':
      value      => 'on',
      persistent => true,
    }
  }
}
