class License < ActiveRecord::Base
  #licenses shouldn't be used on multiple computers but sometimes if not used
  #on both computer it can be installed on more computers.
  has_many :hardwares
  has_many :servers
  
  validates_uniqueness_of :serial, :on => :create, :message => "a déjà été enregistrer"
  validates_presence_of :serial, :software, :version, :language, :user, 
                        :type, :os, :numInstalled, :numLicense, 
                        :on => :create, :message => "ne peut être vide"
end
