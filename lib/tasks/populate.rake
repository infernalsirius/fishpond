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
      h.model_number_id = Populator.words(1).titleize
      h.idNum = 43000..44000.step(10)
      h.serial = 1435972..32097831290
      
      License.populate 2..10 do |l|
        l.software = Populator.words(1..3).titleize
        l.serial = 234254..234560982
        l.licenseType = Populator.words(1).titleize
        l.version = 1..10
        l.user = "Le Soleil"
        l.language = ["Français", "Anglais"]
        l.operating_system_id = ['OS X', 'Windows','Linux', 'Sun', 'Mac OS']
      end
      
      Accessory.populate 3 do |a|
        a.idNum = 45000..47000.step(10)
        a.serial = 234254..234560982
        a.maker_id = 1..10
        a.model = Populator.words(2).titleize
      end
      
      Server.populate 250 do |s|
        s.usage = Populator.words(2).titleize
        s.privIp = rand(255) + "." + rand(255) + "." + rand(255) + "." + rand(255)
        s.pubIp = rand(255) + "." + rand(255) + "." + rand(255) + "." + rand(255)
        s.servName = Faker::Name.domain_name
        s.priUrl = Faker::Internet.domain_word
        s.secUrl = Faker::Internet.domain_word
        s.usrLocal = Faker::Name.user_name
        s.passLocal = "secret- visible pour admin?"
        s.raid = 0..5
        s.configHd = "Utile?"
        s.osVersion = 0..10
        s.osLang = ["Français", "Anglais"]
        s.location = Faker::Address.street_address
        s.rack = 0..55
        s.realtion = "A venir"
        s.numHd = 1..10
        s.rackPosition = 1..60
        s.model_number_id = 1..10
        s.operating_system_id = 1..5
        s.department_id = 1..4
        s.location_id = 1..4
      end
    end
  end  
end