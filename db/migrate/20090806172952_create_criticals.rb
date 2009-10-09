class CreateCriticals < ActiveRecord::Migration
  def self.up
    create_table :criticals do |t|
      t.string :name
      t.timestamps
    end
    add_index :criticals, :name
  end

  def self.down
    remove_index :criticals, :name
    drop_table :criticals
  end
end
