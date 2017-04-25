require 'spec_helper'

describe 'candlepin::config' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      describe 'without parameters' do
        let :pre_condition do
          "class {'candlepin':
            qpid_ssl_cert => '/path/to/ssl/cert',
            qpid_ssl_key => '/path/to/ssl/key',
            amq_enable => true,
            amqp_truststore_password => 'password',
            amqp_keystore_password => 'password',
          }"
        end

        describe "should setup qpid event exchange" do
          it {
            is_expected.to contain_qpid__config__exchange('event')
              .with('exchange' => 'event')
              .with('hostname' => 'localhost')
              .with('port' => 5671)
              .with('ssl_cert' => '/path/to/ssl/cert')
              .with('ssl_key' => '/path/to/ssl/key')
          }
        end
      end
    end
  end
end
