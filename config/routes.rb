ActionController::Routing::Routes.draw do |map|
  map.resources :model_numbers,:collection => {:auto_complete_for_model_number_name => :get}
  map.resources :licenses, 
                  :member => { :clonage => :get}, 
                  :collection => {:auto_complete_for_license_licenseType => :get,
                                  :auto_complete_for_license_software => :get}
  map.resources :users, :member => { :profile => :get}
  map.resource :account, :controller => "users"
  map.resources :accessories, :servers, :locations, :makers, :hardwares
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"

end

