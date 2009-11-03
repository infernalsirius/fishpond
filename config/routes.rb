ActionController::Routing::Routes.draw do |map|
  
  map.resources :licenses, 
                  :member => { :clonage => :get}, 
                  :collection => {:auto_complete_for_license_licenseType => :get }
  map.resources :users, :member => { :profile => :get}
  map.resource :account, :controller => "users"
  map.resources :hardwares, :accessories, :servers, :locations, :makers, :model_numbers
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"

end

