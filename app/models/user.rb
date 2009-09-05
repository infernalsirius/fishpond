class User < ActiveRecord::Base
    acts_as_authentic
    
    validates_presence_of :login, :name, :password, :on => :create, :message => "obligatoire"
    #validates_confirmation_of :password, :on => :create, :message => "faute de frappe"
end
