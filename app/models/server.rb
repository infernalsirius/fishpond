class Server < ActiveRecord::Base
  belongs_to :location
  has_many :accessories
  has_many :licenses
  
  validates_uniqueness_of :privIp, :pubIp, :servName, :priUrl, :secUrl, :on => :create, :message => "doit être unique"
  validates_presence_of :privIp, :servName, :priUrl, :usrLocal, :maker, :raid, :os, :osVersion, :osLang, :location,
                        :on => :create, :message => "obligatoire"
end
