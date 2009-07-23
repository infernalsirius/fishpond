class Server < ActiveRecord::Base
  validates_uniqueness_of :privIp, :pupIp, :servName, :priUrl, :secUrl, :on => :create, :message => "must be unique"
  validates_presence_of :privIp, :servName, :priUrl, :usrLocal, :maker, :raid, :os, :osVersion, :osLang, :location,
                        :on => :create, :message => "can't be blank"
end
