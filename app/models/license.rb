class License < ActiveRecord::Base
  validates_uniqueness_of :serial, :on => :create, :message => "a déjà été enregistrer"
  validates_presence_of :serial, :software, :version, :language, :user, 
                        :type, :os, :numInstalled, :numLicense, 
                        :on => :create, :message => "ne peut être vide"
end
