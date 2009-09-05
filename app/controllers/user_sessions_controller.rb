class UserSessionsController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  layout 'dark'

  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Connexion réussie!"
      redirect_back_or_default hardwares_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Déconnexion réussi!"
    redirect_back_or_default new_user_session_url
  end
end
