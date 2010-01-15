['Mac OS X', 'Windows','Debian','Centos', 'Sun'].each do |os|
  OperatingSystem.find_or_create_by_name(os)
end

['Apple', 'HP', "IBM", "Dell", "Toshiba", "Cisco", "Xerox", "Acer", "LG"].each do |maker|
  Maker.find_or_create_by_name(maker)
end

["Ordinaire", "Imprimante", "Portable", "Serveur", "Terminal"].each do |poste|
  Poste.find_or_create_by_name(poste)
end

["Administration", "Production", "Rédaction", "Informatique", "Tirage", "Vente/Publicité"].each do |dept|
  Department.find_or_create_by_name(dept)
end

["Minutes", "1-2 heures", "3-6 heures", "6-12 heures", "24 heures", "N/A"].each do |crit|
  Critical.find_or_create_by_name(crit)
end

 #base user
 user = User.create! :login => 'admin', 
                     :name => "administrator", 
                     :email => "support@lesoleil.com",
                     :password => "secret",
                     :password_confirmation => "secret",
                     :role => "admin"