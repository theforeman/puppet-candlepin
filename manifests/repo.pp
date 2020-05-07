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
class candlepin::repo (
  String $version,
  String $dist = "el${facts['os']['release']['major']}",
  Boolean $gpgcheck = false,
  Optional[String] $gpgkey = undef,
) {
  yumrepo { 'candlepin':
    descr    => 'Candlepin: an open source entitlement management system.',
    baseurl  => "https://fedorapeople.org/groups/katello/releases/yum/${version}/candlepin/${dist}/\$basearch/",
    gpgkey   => $gpgkey,
    gpgcheck => $gpgcheck,
    enabled  => true,
    before   => Anchor['candlepin::repo'],
  }

  # An anchor is used because it can be collected
  anchor { 'candlepin::repo': } # lint:ignore:anchor_resource
}
