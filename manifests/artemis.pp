# Configuration for Artemis
#
# @api private
class candlepin::artemis {
  assert_private()

  file { $candlepin::broker_config_file:
    ensure  => file,
    content => template('candlepin/broker.xml.erb'),
    mode    => '0640',
    owner   => $candlepin::user,
    group   => $candlepin::group,
  }

  file { "${candlepin::catalina_home}/conf/login.config":
    ensure  => file,
    content => file('candlepin/tomcat/login.config'),
    mode    => '0640',
    owner   => $candlepin::user,
    group   => $candlepin::group,
  }

  file { "${candlepin::catalina_home}/conf/cert-users.properties":
    ensure  => file,
    content => Deferred('inline_epp', ["katelloUser=<%= \$artemis_client_dn %>\n", { 'artemis_client_dn' => $candlepin::artemis_client_dn }]),
    mode    => '0640',
    owner   => $candlepin::user,
    group   => $candlepin::group,
  }

  file { "${candlepin::catalina_home}/conf/cert-roles.properties":
    ensure  => file,
    content => file('candlepin/tomcat/cert-roles.properties'),
    mode    => '0640',
    owner   => $candlepin::user,
    group   => $candlepin::group,
  }

  file { "${candlepin::catalina_home}/conf/conf.d/jaas.conf":
    ensure  => file,
    content => file('candlepin/tomcat/jaas.conf'),
    mode    => '0640',
    owner   => $candlepin::user,
    group   => $candlepin::group,
  }

  if $facts['os']['selinux']['enabled'] {
    selboolean { 'candlepin_can_bind_activemq_port':
      value      => 'on',
      persistent => true,
    }
  }
}
