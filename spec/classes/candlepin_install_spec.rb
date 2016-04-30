require 'spec_helper'

describe 'candlepin::install' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      let :pre_condition do
        "class {'candlepin':}"
      end

      it { should contain_package('candlepin').with('ensure' => 'present') }
    end
  end
end
