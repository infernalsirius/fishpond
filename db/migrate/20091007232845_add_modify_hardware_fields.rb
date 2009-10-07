class AddModifyHardwareFields < ActiveRecord::Migration
  def self.up
    add_column :hardwares, :fonction, :string
    add_column :hardwares, :ram, :integer
    add_column :hardwares, :disk1, :integer
    add_column :hardwares, :disk2, :integer
    add_column :hardwares, :mac2, :string
    rename_column :hardwares, :mac, :mac1
  end

  def self.down
    rename_column :hardwares, :mac1, :mac
    remove_column :hardwares, :mac2
    remove_column :hardwares, :disk2
    remove_column :hardwares, :disk1
    remove_column :hardwares, :ram
    remove_column :hardwares, :fonction
  end
end
