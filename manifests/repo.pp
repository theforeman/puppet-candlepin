class candlepin::repo (
  $manage_repo = $::candlepin::manage_repo,
  $repo        = $::candlepin::repo,
  $dist        = $::candlepin::repo_yumcode,
  $gpgcheck    = $::candlepin::repo_gpgcheck,
  $gpgkey      = $::candlepin::repo_gpgkey,
) {
  if $manage_repo {
    yumrepo { 'candlepin':
      descr    => 'Candlepin: an open source entitlement management system.',
      baseurl  => "https://fedorapeople.org/groups/katello/releases/yum/${repo}/candlepin/${dist}/\$basearch/",
      gpgkey   => $gpgkey,
      gpgcheck => $gpgcheck,
      enabled  => true,
    }
  }
}
