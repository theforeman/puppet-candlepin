require 'spec_helper_acceptance'

def supported_combination
  if fact('os.release.major').to_i == 10
    if fact('candlepin_version') == '5.0'
      true
    else
      false
    end
  else
    if fact('candlepin_version') != '5.0'
      false
    else
      true
    end
  end
end

describe 'creates candlepin repo', if: supported_combination do
    it_behaves_like 'an idempotent resource' do
    let(:manifest) do
      <<-PUPPET
        class { 'candlepin::repo':
          version => pick(fact('candlepin_version'), 'nightly'),
          baseurl => fact('candlepin_baseurl'),
        }

        # Needed as a workaround for idempotency
        if $facts['os']['selinux']['enabled'] {
          package { 'candlepin-selinux':
            ensure  => installed,
            require => Yumrepo['candlepin'],
          }
        }
      PUPPET
    end
  end
end

describe 'candlepin works', if: supported_combination do
  include_examples 'the example', 'basic_candlepin.pp'

  describe port(8443) do
    it { is_expected.to be_listening }
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
end
