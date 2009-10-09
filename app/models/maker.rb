class Maker < ActiveRecord::Base
  has_many :hardwares
  
  validates_uniqueness_of :name, :on => :create, :message => " est déjà utilisé."
  validates_presence_of :name, :on => :create, :message => "ne peut être vide."
end
