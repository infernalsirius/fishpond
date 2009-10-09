class CreatePostes < ActiveRecord::Migration
  def self.up
    create_table :postes do |t|
      t.string :name
      t.timestamps
    end
    add_index :postes, :name
  end

  def self.down
    remove_index :postes, :name
    drop_table :postes
  end
end
