namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    #Delete all entry in those tables in the development database
    [Hardware, Maker, User, License, Accessory, Server, Location].each(&:delete_all)
    
    #Automatiquely populates 150 hardwares entry.
    Hardware.populate 150 do |h|
      h.maker_id = 1..10
      h.model = Populator.words(1).titleize
      h.idNum = 43000..44000.step(10)
      h.serial = 1435972..32097831290
      
      License.populate 2..10 do |l|
        l.software = Populator.words(1..3).titleize
        l.serial = 234254..234560982
        l.licenseType = Populator.words(1).titleize
        l.version = 1..10
        l.user = "Le Soleil"
        l.language = ["Français", "Anglais"]
        l.os = ['OS X', 'Windows','Linux', 'Sun', 'Mac OS']
      end
      
      Accessory.populate 3 do |a|
        a.idNum = 45000..47000.step(10)
        a.serial = 234254..234560982
        a.maker_id = 1..10
        a.model = Populator.words(2).titleize
      end
    end
     
  end  
end
