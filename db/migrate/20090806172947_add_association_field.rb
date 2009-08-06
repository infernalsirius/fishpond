class addAssociationField < ActiveRecord::Migration
  def self.up
     add_column :licenses, :hardware_id, :integer
     add_column :licenses, :server_id, :integer
     add_column :accessories, :server_id, :integer
     add_column :accessories, :harware_id, :integer
     add_column :hardwares, :location_id, :integer
     add_column :servers, :location_id, :integer
   end

   def self.down
     remove_column :servers, :location_id
     remove_column :hardwares, :location_id
     remove_column :accessories, :harware_id
     remove_column :accessories, :column_name
     remove_column :table_name, :column_name
     remove_column :hardwares, :licence_id
   end
end
