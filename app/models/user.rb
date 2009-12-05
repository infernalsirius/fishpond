class User < ActiveRecord::Base
    has_and_belongs_to_many :user_groups
    
    acts_as_authentic
    
    validates_presence_of :login, :name, :password, :on => :create, :message => "obligatoire"
    #validates_confirmation_of :password, :on => :create, :message => "faute de frappe"    
    
end
