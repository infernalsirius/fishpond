class AddHardwareType < ActiveRecord::Migration
  def self.up
    create_table :hardware_types, :force => true do |t|
      t.string :name
      t.integer :hardware_id
      t.timestamps
    end
  end

  def self.down
    drop_table :typables
  end
end
