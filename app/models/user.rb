class User < ActiveRecord::Base    
    acts_as_authentic
    
    validates_presence_of :login, :on => :create
    validates_presence_of :password, :on => :create
    validates_presence_of :name, :on => :create
    validates_confirmation_of :password, :on => :create
end
