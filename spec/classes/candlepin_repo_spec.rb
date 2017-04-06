require 'spec_helper'

describe 'candlepin::repo' do
  context 'with manage_repo => false' do let :params do
      {
        'manage_repo'  => false,
        'repo_version' => 'latest',
        'dist'         => 'el7',
        'gpgcheck'     => false,
        'gpgkey'       => '',
      }
    end

    it { is_expected.not_to contain_yumrepo('candlepin') }
  end

  context 'with manage_repo => true' do
    let :params do
      {
        'manage_repo'  => true,
        'repo_version' => 'latest',
        'dist'         => 'el7',
        'gpgcheck'     => false,
        'gpgkey'       => '',
      }
    end

    it do
      is_expected.to contain_yumrepo('candlepin')
        .with_descr('Candlepin: an open source entitlement management system.')
        .with_baseurl("https://fedorapeople.org/groups/katello/releases/yum/latest/candlepin/el7/\$basearch/")
        .with_gpgkey('')
        .with_gpgcheck(false)
        .with_enabled(true)
    end
  end
end
