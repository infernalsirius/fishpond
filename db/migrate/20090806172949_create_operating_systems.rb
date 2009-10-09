class CreateOperatingSystems < ActiveRecord::Migration
  def self.up
    create_table :operating_systems do |t|
      t.string :name
      t.timestamps
    end
    add_index :operating_systems, :name
  end

  def self.down
    remove_index :operating_systems, :name
    drop_table :operating_systems
  end
end
