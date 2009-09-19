ActionController::Routing::Routes.draw do |map|
  
  map.resources :makers
  map.resources :users, :member => { :profile => :get}
  map.resource :account, :controller => "users"
  map.resources :hardwares, :licenses, :accessories, :servers, :locations
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"

end

