class CreateLicenses < ActiveRecord::Migration
  def self.up
    create_table :licenses, :force => true do |t|
      t.string :software, :version, :language, :serial, :user, :os, :licenseType
      t.integer :numLicense, :numInstalled
      t.timestamps
    end
    add_index :licenses, :software
    add_index :licenses, :os
  end

  def self.down
    remove_index :licenses, :os
    remove_index :licenses, :software
    drop_table :licenses
  end
end
