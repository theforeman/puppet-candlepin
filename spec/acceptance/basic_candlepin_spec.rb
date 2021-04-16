require 'spec_helper_acceptance'

#TODO: Add Artemis listening test https://projects.theforeman.org/issues/29561

describe 'candlepin works' do
  include_examples 'the example', 'basic_candlepin.pp'

  describe port(8443) do
    it { is_expected.to be_listening }
  end

  describe command("curl -k -s -o /dev/null -w '%{http_code}' https://localhost:8443/candlepin/status") do
    its(:stdout) { should eq "200" }
  end

  describe command("curl -s -o /dev/null -w '%{http_code}' --key /etc/candlepin/certs/client-cert.key --cert /etc/candlepin/certs/client-cert.pem --cacert /etc/candlepin/certs/candlepin-ca.crt --tlsv1.3 --tls-max 1.3 https://#{fact('fqdn')}:8443/candlepin/status/") do
    # We don't enable TLSv1.3 by default yet. TLSv1.3 support was added in tomcat 7.0.92
    # But tomcat 7.0.76 is the latest version available on EL7
    its(:stdout) { should eq "000" }
  end

  describe command("curl -s -o /dev/null -w '%{http_code}' --key /etc/candlepin/certs/client-cert.key --cert /etc/candlepin/certs/client-cert.pem --cacert /etc/candlepin/certs/candlepin-ca.crt --tlsv1.2 --tls-max 1.2 https://#{fact('fqdn')}:8443/candlepin/status/") do
    its(:stdout) { should eq "200" }
  end

  describe command("curl -s -o /dev/null -w '%{http_code}' --key /etc/candlepin/certs/client-cert.key --cert /etc/candlepin/certs/client-cert.pem --cacert /etc/candlepin/certs/candlepin-ca.crt --tlsv1.1 --tls-max 1.1 https://#{fact('fqdn')}:8443/candlepin/status/") do
    its(:stdout) { should eq "000" }
  end

  describe command("curl -s -o /dev/null -w '%{http_code}' --key /etc/candlepin/certs/client-cert.key --cert /etc/candlepin/certs/client-cert.pem --cacert /etc/candlepin/certs/candlepin-ca.crt --tlsv1.0 --tls-max 1.0 https://#{fact('fqdn')}:8443/candlepin/status/") do
    its(:stdout) { should eq "000" }
  end
end
