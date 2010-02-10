class Ability
  include CanCan::Ability
  
  def initialize(user)
    if user.role == "admin"
      can :manage, :all
    else
      can :read, [Hardware, License, Server, Accessory, Critical]
      can :manage, User
    end
  end
=begin
  can :assign_roles, User do 
    user.is? :admin
  end
=end
end