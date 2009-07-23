class Hardware < ActiveRecord::Base
  belongs_to :location
  
  validates_uniqueness_of :serial, :mac, :idNum, 
          :message => "Le numéro de série, l'adresse MAC ou le numéro d'identification du matériel a déjà été entré."
end
