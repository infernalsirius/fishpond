class UsersController < ApplicationController
    before_filter :require_user, :only => [:index, :show, :update, :edit]
    layout 'dark'
    
    def index
      @users = User.paginate(:per_page => 10, :page => params[:page])
    end
    
    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      if @user.save
        flash[:notice] = "Compte enregistré!"
        redirect_back_or_default new_user_session_path
      else
        render :action => :new
      end
    end

    def show
      @user = @current_user
    end

    def edit
      @user = @current_user
    end

    def update
      @user = @current_user # makes our views "cleaner" and more consistent
      if @user.update_attributes(params[:user])
        flash[:notice] = "Compte mis à jour!"
        redirect_to account_url
      else
        render :action => :edit
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
