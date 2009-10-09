class Server < ActiveRecord::Base
  belongs_to :location
  has_many :accessories
  has_many :licenses
  belongs_to :OperatingSystem
  belongs_to :maker
  
  validates_uniqueness_of :privIp, :pubIp, :servName, :priUrl, :secUrl, :on => :create, :message => "doit être unique"
  validates_presence_of :privIp, :servName, :priUrl, :usrLocal, :maker, :raid, :os, :osVersion, :on => :create, :message => "obligatoire"
end
