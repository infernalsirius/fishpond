class UsersController < ApplicationController
    # cancan method to automatically authorize all 
    # actions in a RESTful style resource controller
    load_and_authorize_resource
    
    before_filter :require_user, :only => [:index, :show, :update, :edit]
    layout 'dark'
    
    def index
      @users = User.paginate(:per_page => 10, :page => params[:page])
      
      respond_to do |wants|
        wants.html
      end
    end
    
    def new
      @user = User.new
      
      respond_to do |wants|
        wants.html
      end
    end

    def create
      @user = User.new(params[:user])
      
      respond_to do |wants|
        if @user.save
          flash[:notice] = "Compte enregistré!"
          
          wants.html { redirect_back_or_default(new_user_session_path) }
        else
          wants.html {redirect_back_or_default( new_user_path)}
        end
      end
    end

    def show
      @user = User.find(params[:id])
      
      respond_to do |wants|
        wants.html
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id]) # makes our views "cleaner" and more consistent
      
      respond_to do |wants|
        if @user.update_attributes(params[:user])
          flash[:notice] = "Compte mis à jour!"
          wants.html { redirect_to users_path }
        else
          wants.html { render edit_user_path(:id) }
        end
      end
    end
    
    def destroy
      @user = User.find(params[:id])
      @user.destroy

      respond_to do |wants|
        wants.html { redirect_to users_path }
      end      
    end
end
