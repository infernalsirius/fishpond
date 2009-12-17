namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    #Delete all entry in those tables in the development database
    [Hardware, Maker, License, Accessory, Server, Location].each(&:delete_all)
    
    #########
    # For relationship data
    #######################################################
    
    Maker.populate 15 do |m|
      m.name = Faker::Company.name
    end
    
    @os = ['Mac OS X', 'Windows','Debian','Centos', 'Sun']

    OperatingSystem.populate 5 do |op|
        op.name = @os
    end
    
    ModelNumber.populate 50 do |mn|
      mn.name = Populator.words(1).titleize
    end
    
    Critical.populate 9 do |c|
      c.name = 1..9
    end
    #########
    # For model data
    #######################################################
    
    License.populate 40 do |l|
      l.software = Populator.words(1..3).titleize
      l.serial = 234254..234560982
      l.licenseType = Populator.words(1).titleize
      l.version = 1..10
      l.user = "Le Soleil"
      l.language = ["Français", "Anglais"]
      l.operating_system_id = 1..5
    end
    
    Accessory.populate 3 do |a|
      a.idNum = 45000..47000.step(10)
      a.serial = 234254..234560982
      a.maker_id = 1..15
      a.model_number_id = 1..50
    end
    
    Hardware.populate 150 do |h|
      h.maker_id = 1..15
      h.model_number_id = 1..50
      h.idNum = 43000..44000.step(10)
      h.serial = 1435972..32097831290
      h.poste_id = 1..5
    end
    
    def randIP
      rand(255).to_s + "." + rand(255).to_s + "." + rand(255).to_s + "." + rand(255).to_s
    end
    
    Server.populate 100 do |s|
      s.usage = Populator.words(2).titleize
      s.privIp = randIP
      s.pubIp = randIP
      s.servName = Faker::Internet.domain_name
      s.priUrl = Faker::Internet.domain_word
      s.secUrl = Faker::Internet.domain_word
      s.usrLocal = Faker::Internet.user_name
      s.passLocal = "secret- visible pour admin?"
      s.raid = 0..5
      s.configHd = "Utile?"
      s.osVersion = 0..10
      s.osLang = ["Français", "Anglais"]
      s.location = Faker::Address.street_address
      s.rack = 0..55
      s.relation = "A venir"
      s.numHd = 1..10
      s.rackPosition = 1..60
      s.model_number_id = 1..10
      s.operating_system_id = 1..5
      s.department_id = 1..4
      s.location_id = 1..4
    end
  end  
end