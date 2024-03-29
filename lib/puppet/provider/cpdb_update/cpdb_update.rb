Puppet::Type.type(:cpdb_update).provide(:cpdb_update) do

  commands :cpdb => '/usr/share/candlepin/cpdb'

  def create
    migrate_database
  end

  def exists?
    !pending_migrations?
  end

  private

  def migrate_database
    cpdb(
      "--update",
      "--dbhost=#{resource[:db_host]}",
      "--dbport=#{resource[:db_port]}",
      "--database=#{resource[:db_name]}#{resource[:ssl_options]}",
      "--user=#{resource[:db_user]}",
      "--password=#{resource[:db_password]}"
    )
  end

  def pending_migrations?
    output = cpdb(
      "--status",
      "--dbhost=#{resource[:db_host]}",
      "--dbport=#{resource[:db_port]}",
      "--database=#{resource[:db_name]}#{resource[:ssl_options]}",
      "--user=#{resource[:db_user]}",
      "--password=#{resource[:db_password]}"
    )

    output.include?("changesets have not been applied")
  end
end
