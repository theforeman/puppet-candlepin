require 'spec_helper'

describe 'candlepin::repo' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      describe 'with nightly version' do
        let(:params) do
          { version: 'nightly' }
        end

        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_yumrepo('candlepin')
            .with_descr('Candlepin: an open source entitlement management system.')
            .with_baseurl("https://yum.theforeman.org/candlepin/nightly/el#{facts[:os]['release']['major']}/\$basearch/")
            .with_gpgkey(nil)
            .with_gpgcheck(false)
            .with_enabled(true)
            .that_comes_before('Anchor[candlepin::repo]')
        end

        it { is_expected.to contain_anchor('candlepin::repo') }
      end

      describe 'with baseurl' do
        let(:params) do
          {
            baseurl: "https://stagingyum.theforeman.org/candlepin/nightly/el#{facts[:os]['release']['major']}/\$basearch/"
          }
        end

        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_yumrepo('candlepin')
            .with_descr('Candlepin: an open source entitlement management system.')
            .with_baseurl("https://stagingyum.theforeman.org/candlepin/nightly/el#{facts[:os]['release']['major']}/\$basearch/")
            .with_gpgkey(nil)
            .with_gpgcheck(false)
            .with_enabled(true)
            .that_comes_before('Anchor[candlepin::repo]')
        end

        it { is_expected.to contain_anchor('candlepin::repo') }
      end
    end
  end
end
