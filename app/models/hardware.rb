class Hardware < ActiveRecord::Base
  belongs_to :location
  has_many :licenses
  has_many :accessories
  
  
  validates_uniqueness_of :serial, :on => :create, :message => "est déjà utilisé."
  validates_uniqueness_of :mac, :on => :create, :message => "est déjà utilisée."
  validates_uniqueness_of :idNum, :on => :create, :message => "est déjà utilisé."
  validates_presence_of :idNum, :serial, :maker, :location_id, :on => :create, :message => "obligatoire"
  
end
