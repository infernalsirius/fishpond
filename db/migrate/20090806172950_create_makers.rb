class CreateMakers < ActiveRecord::Migration
  def self.up
    create_table :makers do |t|
      t.string :name
      t.timestamps
    end
    add_index :makers, :name
  end

  def self.down
    remove_index :makers, :name
    drop_table :makers
  end
end
