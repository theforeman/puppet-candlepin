Puppet::Type.type(:cpdb_update).provide(:podman) do

  commands :podman => 'podman'

  def create
    migrate_database
    update_version_file
  end

  def exists?
    return false if previous_candlepin_version.nil?
    return false if candlepin_rpm_version.nil?

    Gem::Version.new(previous_candlepin_version) == Gem::Version.new(candlepin_rpm_version)
  end

  private

  def migrate_database
    podman(
      "run",
      "--network=host",
      "quay.io/ehelms/candlepin:4.3.12",
      "/usr/share/candlepin/cpdb",
      "--update",
      "--dbhost=#{resource[:db_host]}",
      "--dbport=#{resource[:db_port]}",
      "--database=#{resource[:db_name]}#{resource[:ssl_options]}",
      "--user=#{resource[:db_user]}",
      "--password=#{resource[:db_password]}"
    )
  end

  def version_file
    "/var/lib/candlepin/.puppet-candlepin-rpm-version"
  end

  def update_version_file
    File.open(version_file, "w") do |file|
      file.write(candlepin_rpm_version)
    end
  end

  def candlepin_rpm_version
    podman(
      'run',
      "--network=host",
      "quay.io/ehelms/candlepin:4.3.12",
      'rpm',
      '-q',
      'candlepin',
      '--queryformat=%{version}'
    )
  end

  def previous_candlepin_version
    File.read(version_file) if File.exist?(version_file)
  end
end
