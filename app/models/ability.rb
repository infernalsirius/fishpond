class Ability
  include CanCan::Ability
  
  def initialize(user)
    
    can :manage, :all if user.is? :admin
    can :assign_roles, User do
      user.is? :admin
    end
    
    if user.is? :cadre
      can :update, User
      can :read, :all
    else
      can :read, :all
    end
    
    
  end
  
  
  
end