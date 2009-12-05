class ModifyUsersTable < ActiveRecord::Migration
  def self.up
    add_column :users, :perishable_token, :string, {:null => false, :default => 0}
    add_column :users, :failed_login_count, :integer, {:null => false, :default => 0}
    add_index :users, :perishable_token
    add_index :users, :email
  end

  def self.down
    remove_index :users, :email
    remove_column :users, :email
    remove_index :users, :perishable_token
    remove_column :users, :failed_login_count
    remove_column :users, :perishable_token
  end
end
