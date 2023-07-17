require 'spec_helper_acceptance'

describe 'dnf module support' do
 context 'when swapping to maven 3.8' do
    before(:context) do
      on default, 'dnf module reset maven -y'
      on default, 'dnf module enable maven:3.5 -y'
    end

    include_examples 'the example', 'basic_candlepin.pp'

    describe command('dnf module list --enabled --quiet') do
      its(:stdout) { is_expected.to include('pki-core').and match(/^maven\s+3\.8/) }
    end
  end
end
