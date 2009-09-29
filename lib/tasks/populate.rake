namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    #Delete all entry in those tables in the development database
    [Hardware, Maker, User, License, Accessory, Server, Location].each(&:delete_all)
    
    #Automatiquely populates 150 hardwares entry.
    Hardware.populate 150 do |foo|
      hardware.maker = ['Apple', 'HP', "IBM", "Dell", "Toshiba", "Cisco", "Epson", "Xerox", "Acer", "LG"]
      hardware.model = Populator.words(1).titleize
      
    end 
  end  
end