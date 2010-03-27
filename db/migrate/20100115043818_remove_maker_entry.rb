class RemoveMakerEntry < ActiveRecord::Migration
  def self.up
   remove_column :licenses, :maker
  end

  def self.down
    add_column :licenses, :maker, :string
  end
end
