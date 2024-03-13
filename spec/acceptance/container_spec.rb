require 'spec_helper_acceptance'

#TODO: Add Artemis listening test https://projects.theforeman.org/issues/29561

describe 'candlepin works as a container' do
  before(:all) do
    cleanup_installation
  end

  it_behaves_like 'an idempotent resource' do
    let(:manifest) do
      basic_manifest(true)
    end
  end

  describe port(8443) do
    it { is_expected.to be_listening }
  end

  describe package('candlepin') do
    it { is_expected.not_to be_installed }
  end

  describe file("/etc/containers/systemd/tomcat.container") do
    it { should be_file }
    it { should be_mode 440 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe command('curl -k -s -o /dev/null -w \'%{http_code}\' https://localhost:8443/candlepin/status') do
    its(:stdout) { should eq "200" }
  end

  describe command('nmap --script +ssl-enum-ciphers localhost -p 8443') do
    # We don't enable TLSv1.3 by default yet. TLSv1.3 support was added in tomcat 7.0.92
    # But tomcat 7.0.76 is the latest version available on EL7
    its(:stdout) { should_not match(/TLSv1\.3/) }

    # Test that TLSv1.2 is enabled
    its(:stdout) { should match(/TLSv1\.2/) }

    # Test that older TLS versions are disabled
    its(:stdout) { should_not match(/TLSv1\.1/) }
    its(:stdout) { should_not match(/TLSv1\.0/) }

    # Test that the least cipher strength is "strong" or "A"
    its(:stdout) { should match(/least strength: (A|strong)/) }
  end

  describe file("/etc/tomcat/cert-users.properties") do
    it { should be_file }
    it { should be_mode 640 }
    it { should be_owned_by 'tomcat' }
    it { should be_grouped_into 'tomcat' }
    its(:content) { should eq("katelloUser=CN=ActiveMQ Artemis Deferred, OU=Artemis, O=ActiveMQ, L=AMQ, ST=AMQ, C=AMQ\n") }
  end
end
