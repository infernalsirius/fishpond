class AddHardwareRelationship < ActiveRecord::Migration
  def self.up
    add_column :hardwares, :poste_id, :integer
    add_column :hardwares, :critical_id, :integer
    add_column :hardwares, :department_id, :integer
    add_column :hardwares, :maker_id, :integer
    add_column :hardwares, :operating_system_id, :integer
  end

  def self.down
    remove_column :hardwares, :operating_system_id
    remove_column :hardwares, :maker_id
    remove_column :hardwares, :department_id
    remove_column :hardwares, :critical_id
    remove_column :hardwares, :poste_id
  end
end
