require 'spec_helper'

describe 'candlepin' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      describe 'base class' do
        it { should compile.with_all_deps }
        it { should contain_class('candlepin::repo') }
        it { should contain_class('candlepin::install') }
        it { should contain_class('candlepin::config') }
        it { should contain_class('candlepin::database::postgresql') }
        it { should contain_class('candlepin::service') }
        it { should contain_service('tomcat').with_ensure('running') }
      end

      describe 'notify' do
        let :pre_condition do
          <<-EOS
          exec { 'notification':
            command => '/bin/true',
            notify  => Class['candlepin'],
          }

          exec { 'dependency':
            command => '/bin/true',
            require => Class['candlepin'],
          }
          EOS
        end

        it { should contain_exec('notification').that_notifies('Service[tomcat]') }
        it { should contain_exec('dependency').that_requires(['Service[tomcat]', 'Exec[cpinit]']) }
      end
    end
  end
end
