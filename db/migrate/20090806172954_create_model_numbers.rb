class CreateModelNumbers < ActiveRecord::Migration
  def self.up
    create_table :model_numbers do |t|
      t.string :name
      t.timestamps
    end
    add_index :model_numbers, :name
  end

  def self.down
    remove_index :model_numbers, :name
    drop_table :model_numbers
  end
end
