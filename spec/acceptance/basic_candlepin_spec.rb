require 'spec_helper_acceptance'

#TODO: Add Artemis listening test https://projects.theforeman.org/issues/29561

describe 'candlepin works' do
  include_examples 'the example', 'basic_candlepin.pp'

  describe port(8443) do
    it { is_expected.to be_listening }
  end

  describe command('curl -k -s -o /dev/null -w \'%{http_code}\' https://localhost:8443/candlepin/status') do
      its(:stdout) { should eq "200" }
  end
end
