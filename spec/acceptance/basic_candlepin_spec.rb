require 'spec_helper_acceptance'

describe 'candlepin works' do
  include_examples 'the example', 'basic_candlepin.pp'

  describe port(8080) do
    it { is_expected.to be_listening }
  end

  describe command('curl -s -o /dev/null -w \'%{http_code}\' http://localhost:8080/candlepin/status') do 
      its(:stdout) { should eq "200" }
  end
end
