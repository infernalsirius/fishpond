class Hardware < ActiveRecord::Base
  belongs_to :maker
  belongs_to :department
  belongs_to :location
  belongs_to :model_number
  has_many :licenses
  has_many :accessories
  
  validates_uniqueness_of :serial, :on => :create, :message => "doit être unique"
  validates_uniqueness_of :idNum, :on => :create, :message => "doit être unique"
  validates_uniqueness_of :mac1, :mac2, :on => :create, :message => "doit être unique", :allow_blank => true
  validates_presence_of :idNum, :serial, :maker, :on => :create, :message => "obligatoire"
  validates_presence_of :department_id, :on => :create, :message => "doit être sélectionné"
  
end
