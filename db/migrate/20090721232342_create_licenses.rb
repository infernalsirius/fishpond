class CreateLicenses < ActiveRecord::Migration
  def self.up
    create_table :licenses, :force => true do |t|
      t.string :software, :version, :language, :serial, :user, :licenseType
      t.integer :numLicense, :numInstalled, :operating_system_id, :hardware_id, :server_id
      t.timestamps
    end
    add_index :licenses, :software
  end

  def self.down
    remove_index :licenses, :software
    drop_table :licenses
  end
end