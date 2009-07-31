class ModifyLicenseTable < ActiveRecord::Migration
  def self.up
    rename_column :licenses, :type, :licenseType
  end

  def self.down
    rename_column :licenses, :licenseType, :type
  end
end
