class AddAssetsNumber < ActiveRecord::Migration
  def self.up
    add_column :licenses, :asset_number, :string
  end

  def self.down
    remove_column :licenses, :asset_number
  end
end
