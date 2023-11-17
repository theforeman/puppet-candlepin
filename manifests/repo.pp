# @summary Manage the yum repository
#
# @param version
#   Which yum repository to install. For example latest or 3.3. Note that the
#   versions are Katello releases.
#
# @param dist
#   The dist code to use in the URL
#
# @param gpgcheck
#   Whether to check the GPG signatures
#
# @param gpgkey
#   The GPG key to use
#
# @param baseurl
#   An optional base URL to be used for yumrepo, instead of the default
class candlepin::repo (
  Variant[Undef, Enum['nightly'], Pattern['^\d+\.\d+$']] $version = undef,
  String $dist = "el${facts['os']['release']['major']}",
  Boolean $gpgcheck = false,
  Optional[String] $gpgkey = undef,
  Optional[Stdlib::HTTPUrl] $baseurl = undef,
) {
  unless $baseurl {
    assert_type(NotUndef, $version)
  }

  yumrepo { 'candlepin':
    descr    => 'Candlepin: an open source entitlement management system.',
    baseurl  => pick($baseurl, "https://yum.theforeman.org/candlepin/${version}/${dist}/\$basearch/"),
    gpgkey   => $gpgkey,
    gpgcheck => $gpgcheck,
    enabled  => true,
    before   => Anchor['candlepin::repo'],
  }

  # An anchor is used because it can be collected
  anchor { 'candlepin::repo': } # lint:ignore:anchor_resource
}
