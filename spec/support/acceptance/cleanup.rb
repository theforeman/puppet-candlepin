def cleanup_installation
  on default, 'dnf -y remove candlepin candlepin-selinux pki-*'
  on default, 'rm -rf /etc/tomcat /etc/candlepin'
  on default, 'rm -rf /etc/containers/systemd/tomcat.container'
end
