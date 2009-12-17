Lockdown::System.configure do

  options[:session_timeout_method] = :clear_authlogic_session 

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Public Access
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    set_permission(:login).with_controller(:user_sessions)

    set_permission(:register_account).with_controller(:users).only_methods(:new, :create)


    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Protected Access
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    set_permission(:my_account).with_controller(:users).only_methods(:show, :edit, :update)
    
end 
