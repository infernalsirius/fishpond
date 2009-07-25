class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers, :force => true do |t|
      t.string :usage, :privIp, :pubIp, :servName, :priUrl, :secUrl, 
                :usrLocal, :passLocal, :maker, :model, :raid, :configHd,
                :os, :osVersion, :osLang, :location, :rack, :relation
      t.integer :numHd, :rackPosition
    end
    add_index :servers, :servName
  end

  def self.down
    remove_index :servers, :servName
  end
end
