class CreateCriticals < ActiveRecord::Migration
  def self.up
    create_table :criticals do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :criticals
  end
end
