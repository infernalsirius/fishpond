class ModelNumber < ActiveRecord::Base
  has_many :hardwares
  
  validates_uniqueness_of :name, :on => :create, :message => "doit être unique"
end
