class User < ActiveRecord::Base
    acts_as_authentic
    
    validates_presence_of :login, :name, :password, :on => :create, :message => "ne peut être vide."
end
