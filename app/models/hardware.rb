class Hardware < ActiveRecord::Base
  belongs_to :maker
  belongs_to :department
  belongs_to :location
  has_many :licenses
  has_many :accessories
  
  validates_uniqueness_of :serial, :on => :create, :message => "doit être unique"
  validates_uniqueness_of :idNum, :on => :create, :message => "doit être unique"
  validates_uniqueness_of :mac, :on => :create, :message => "doit être unique"
  validates_presence_of :idNum, :serial, :maker, :department, :on => :create, :message => "obligatoire"
  
end
