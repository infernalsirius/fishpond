class CreateAccessories < ActiveRecord::Migration
  def self.up
    create_table :accessories, :force => true do |t|
      t.string :idNum, :diag, :serial, :model
      t.integer :maker_id, :server_id, :hardware_id, :modelNumber_id
      t.timestamps
    end
    add_index :accessories, :model
  end

  def self.down
    remove_index :accessories, :model
    drop_table :accessories
  end
end