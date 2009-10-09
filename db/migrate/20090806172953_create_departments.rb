class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :name
      t.timestamps
    end
    add_index :departments, :name
  end

  def self.down
    remove_index :departments, :name
    drop_table :departments
  end
end
