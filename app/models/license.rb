class License < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :server
  belongs_to :operating_system
  belongs_to :maker
  validates_uniqueness_of :serial, :on => :create, :message => "a déjà été enregistrer"
  validates_presence_of :serial, :software, :version, :language, 
                        :licenseType, :operating_system_id, 
                        :on => :create, :message => "ne peut être vide"


  def search_for_soft(name)
    softwares = Licenses.find_by_name
  end

end