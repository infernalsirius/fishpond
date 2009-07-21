class AddUserEmailandName < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.colunm :name, :string, :null => false
      t.column :email, :string, :null => false
      t.index :name, :email
    end
  end

  def self.down
    remove_index :users, :email
    remove_index :users, :name
    remove_column :users, :email
    remove_column :users, :name
  end
end
