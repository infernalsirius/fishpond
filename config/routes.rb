ActionController::Routing::Routes.draw do |map|
  
  map.resources :model_numbers,:collection => {:auto_complete_for_model_number_name => :get}
  map.resources :hardwares, :member => {:clonage => :get, :create_clone => :post}
                          
  map.resources :licenses, :member => { :clonage => :get, :create_clone => :post}, 
                           :collection => {:auto_complete_for_license_licenseType => :get,
                           :auto_complete_for_license_software => :get,
                           :auto_complete_for_license_maker_id => :get,
                           :biglisting => :get}
                           
  map.resources :users, :member => { :profile => :get}
  map.resource :account, :controller => "users"
  map.login "/login", :controller => "user_sessions", :action => "new"
  map.logout "/logout", :controller => "user_sessions", :action => "destroy"
  map.resources :accessories, :servers, :locations, :makers
  map.resource :user_session
  map.netzke
  map.root :controller => "user_sessions", :action => "new"

end

