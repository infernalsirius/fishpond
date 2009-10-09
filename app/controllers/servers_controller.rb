class ServersController < ApplicationController
  before_filter :require_user
  layout 'dark'
  
  def index
    @servers = Server.paginate(:per_page => 10, :page => params[:page])
    
    respond_to do |wants|
      wants.html
    end
  end
  
  def new
    @server = Server.new
    @locations = Location.find(:all)
    @makers = Maker.find(:all)
    @os = OperatingSystem.find(:all)
  end
  
  def create
    @server = Server.new(params[:server])
    @locations = Location.find(:all)

    respond_to do |wants|
      if @server.save
          flash[:notice] = "Le serveur a été sauvegardé avec succès."
          wants.html { redirect_to servers_path}
      else
        flash[:notice] = "Le serveur saisi n'a pus être sauvegardé."
        wants.html {render new_server_path, :layout => 'dark'}
      end
    end
  end
  
  def show
    @server = Server.find(params[:id])
  end
    
  def edit
    @server = Server.find(params[:id])
    @makers = Maker.find(:all)
    @os = OperatingSystem.find(:all)
    @locations = Location.find(:all)
  end
  
  def update
    @server = Server.find(params[:id])
    
    respond_to do |wants|
      if @server.update_attributes(params[:server])
        wants.html { redirect_to servers_path }
      else
        flash[:notice] = "Le serveur n'a pu être mis à jour."
        wants.html { render edit_server_path(params[:id]) }
      end
    end
  end
  
  def destroy
    @server = Server.find(params[:id])
    @server.destroy
    
    respond_to do |wants|
      wants.html { redirect_to servers_path }
    end
  end
end
