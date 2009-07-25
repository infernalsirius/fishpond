class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations, :force => true do |t|
      t.string :building
      t.integer :num, :floor
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
