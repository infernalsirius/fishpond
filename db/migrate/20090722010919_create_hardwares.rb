class CreateHardwares < ActiveRecord::Migration
  def self.up
    create_table :hardwares do |t|
      t.integer :idNum, :maker_id, :poste_id, :critical_id, :department_id, 
                :operating_system_id, :model_number_id, :location_id, :ram,
                :disk1, :disk2,
      t.string :mac1, :mac2, :serial, :fonction
      t.timestamps
    end
    add_index :hardwares, :idNum
  end

  def self.down
    remove_index :hardwares, :idNum
    drop_table :hardwares
  end
end