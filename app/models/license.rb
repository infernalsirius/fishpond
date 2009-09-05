class License < ActiveRecord::Base
  belongs_to :hardware
  has_many :servers
  
  validates_uniqueness_of :serial, :on => :create, :message => "a déjà été enregistrer"
  validates_presence_of :serial, :software, :version, :language, :user, 
                        :type, :os, :numLicense, 
                        :on => :create, :message => "ne peut être vide"
end
