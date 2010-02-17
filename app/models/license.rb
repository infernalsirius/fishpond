class License < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :server
  belongs_to :operating_system
  validates_uniqueness_of :serial, :on => :create, :message => "a déjà été enregistrer"
  validates_presence_of :serial, :software, :version, :language, 
                        :licenseType, :operating_system_id, 
                        :on => :create, :message => "ne peut être vide"          


  def self.find_licenses_by_os(operating_system)
    @licenses = License.find(:all, :conditions => [":operating_system_id = ?", operating_system])
    
  end

end