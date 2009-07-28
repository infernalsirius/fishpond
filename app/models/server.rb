class Server < ActiveRecord::Base
  belongs_to :location
  has_many :accessories
  has_many :licenses
  
  validates_uniqueness_of :privIp, :pupIp, :servName, :priUrl, :secUrl, :on => :create, :message => "Doit être unique"
  validates_presence_of :privIp, :servName, :priUrl, :usrLocal, :maker, :raid, :os, :osVersion, :osLang, :location,
                        :on => :create, :message => "Ne peut être vide"
end
