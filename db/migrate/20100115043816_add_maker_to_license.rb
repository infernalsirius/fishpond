class AddMakerToLicense < ActiveRecord::Migration
  def self.up
    add_column :licenses, :maker, :string
  end

  def self.down
    remove_column :licenses, :maker
  end
end
