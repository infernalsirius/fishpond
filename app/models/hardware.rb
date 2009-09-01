class Hardware < ActiveRecord::Base
  belongs_to :location
  has_many :licenses
  has_many :accessories
  
  
  validates_uniqueness_of :serial, :mac, :idNum, 
          :message => "Le numéro de série, l'adresse MAC ou le numéro d'identification du matériel a déjà été entré."
  validates_presence_of :idNum, :serial, :maker, :location_id, :on => :create, :message => "Doit être saisie"
  
end
