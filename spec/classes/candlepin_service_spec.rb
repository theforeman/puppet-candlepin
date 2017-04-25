require 'spec_helper'

describe 'candlepin::service' do
  context 'with run_init => true' do
    let :pre_condition do
      'package {"wget": }'
    end

    let :params do
      {
        'run_init' => true,
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_service('tomcat') }
    it { is_expected.to contain_exec('cpinit') }
  end

  context 'with run_init false' do
    let :params do
      {
        'run_init' => false,
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_service('tomcat') }
    it { is_expected.not_to contain_exec('cpinit') }
  end
end
