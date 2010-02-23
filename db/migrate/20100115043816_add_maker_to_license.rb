class AddMakerToLicense < ActiveRecord::Migration
  def self.up
    add_column :licenses, :maker_id, :string
  end

  def self.down
    remove_column :licenses, :maker_id
  end
end
