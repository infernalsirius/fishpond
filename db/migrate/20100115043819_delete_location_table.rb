class DeleteLocationTable < ActiveRecord::Migration
  def self.up
    drop_table :locations
    add_column :hardwares, :location, :string
  end

  def self.down
    remove_column :hardwares, :location
    create_table "locations", :force => true do |t|
      t.string   "building"
      t.integer  "num"
      t.integer  "floor"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end