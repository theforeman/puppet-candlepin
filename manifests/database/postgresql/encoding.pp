# @summary Class to ensure the packages for encoding are installed
# @api private
class candlepin::database::postgresql::encoding {
  stdlib::ensure_packages(['glibc-langpack-en'])
}
