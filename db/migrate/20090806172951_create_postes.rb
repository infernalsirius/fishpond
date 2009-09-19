class CreatePostes < ActiveRecord::Migration
  def self.up
    create_table :postes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :postes
  end
end
