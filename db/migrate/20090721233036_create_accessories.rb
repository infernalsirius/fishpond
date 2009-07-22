class CreateAccessories < ActiveRecord::Migration
  def self.up
    create_table :accessories, :force => true do |t|
      t.string :idNum, :diag, :serial, :maker, :model
      t.timestamps
    end
    add_index :accessories, :maker
    add_index :accessories, :model
  end

  def self.down
    remove_index :accessories, :model
    remove_index :accessories, :maker
    drop_table :accessories
  end
end
