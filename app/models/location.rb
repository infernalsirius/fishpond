class Location < ActiveRecord::Base
  has_many :hardwares
  has_many :servers
  
  validates_presence_of :building, :num, :floor, :on => :create, :message => "ne peut être vide."
end
