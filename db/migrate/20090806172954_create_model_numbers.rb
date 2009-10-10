class CreateModelNumbers < ActiveRecord::Migration
  def self.up
    create_table :model_numbers do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :model_numbers
  end
end
