class AddUserEmailandName < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.column :name, :string
      t.column :email, :string
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
