class ModifyServerRelationships < ActiveRecord::Migration
  def self.up
    rename_column :servers, :maker, :maker_id
    rename_column :servers, :os, :operating_system_id
    rename_column :servers, :location, :location_id
  end

  def self.down
    rename_column :servers, :location_id, :location
    rename_column :servers, :OperatingSystem_id, :os
    rename_column :servers, :maker_id, :maker
  end
end
