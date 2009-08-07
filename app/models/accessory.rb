class Accessory < ActiveRecord::Base
  belongs_to :harware
  belongs_to :server
  
  validates_presence_of :idNum, :on => :create, :message => "ne peut être vide"
  validates_presence_of :maker, :on => :create, :message => "ne peut être vide"
  validates_presence_of :serial, :on => :create, :message => "ne peut être vide"
  validates_format_of :diag, :with => /^[\d]+$/, :on => :create, :message => "chiffre uniquement"
end
