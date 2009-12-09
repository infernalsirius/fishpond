class ModelNumber < ActiveRecord::Base
  has_many :hardwares
  has_many :servers
  
  validates_uniqueness_of :name, :on => :create, :message => "doit être unique"
  validates_presence_of :name, :on => :create, :message => "doit être saisi"
end
