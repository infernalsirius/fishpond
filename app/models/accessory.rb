class Accessory < ActiveRecord::Base
  belongs_to :harware
  belongs_to :server
  
  validates_presence_of :idNum, :maker, :serial, :on => :create, :message => "obligatoire"
  validates_format_of :diag, :with => /^[\d]+$/, :on => :create, :message => "chiffre uniquement", :allow_blank => true
end
 