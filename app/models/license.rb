class License < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :server
  belongs_to :OperatingSystem
  validates_uniqueness_of :serial, :on => :create, :message => "a déjà été enregistrer"
  validates_presence_of :serial, :software, :version, :language, :user, 
                        :licenseType, :operating_system_id, 
                        :on => :create, :message => "ne peut être vide"
end
