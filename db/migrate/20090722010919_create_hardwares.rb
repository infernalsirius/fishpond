class CreateHardwares < ActiveRecord::Migration
  def self.up
    create_table :hardwares do |t|
      t.integer :idNum
      t.string :maker, :mac, :model, :serial
      t.timestamps
    end
    add_index :hardwares, :maker
    add_index :hardwares, :model
  end

  def self.down
    remove_index :hardwares, :model
    remove_index :hardwares, :maker
    drop_table :hardwares
  end
end
