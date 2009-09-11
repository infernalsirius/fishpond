class AddHardwareType < ActiveRecord::Migration
  def self.up
    create_table :typables, :force => true do |t|
      t.
      t.timestamps
    end
  end

  def self.down
    drop_table :typables
  end
end
