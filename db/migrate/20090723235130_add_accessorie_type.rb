class AddAccessorieType < ActiveRecord::Migration
  def self.up
    add_column :accessories, :type, :string
    add_column :G, :column_name, :string
    marcc
  end

  def self.down
    remove_column :table_name, :column_name
    remove_column :hardwares, :type
    remove_column :table_name, :column_name
    remove_column :table_name, :column_name
    remove_column :table_name, :column_name
  end
end
