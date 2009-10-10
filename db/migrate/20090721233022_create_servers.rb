class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers, :force => true do |t|
      t.string :usage, :privIp, :pubIp, :servName, :priUrl, :secUrl, 
                :usrLocal, :passLocal, :raid, :configHd, :osVersion, :osLang, 
                :location, :rack, :relation
      t.integer :numHd, :rackPosition, :model_number_id, :maker_id, :operating_system_id, 
                :department_id, :location_id
    end
    add_index :servers, :servName
  end

  def self.down
    remove_index :servers, :servName
  end
end
