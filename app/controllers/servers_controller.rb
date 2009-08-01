class ServersController < ApplicationController
  layout 'dark'
  
  def index
    @servers = Server.paginate(:per_page => 10, :page => params[:page])
    
    respond_to do |wants|
      wants.html
    end
  end
  
  def new
    @server = Server.new
  end
  
  def create
    @server = Server.new(params[:server])
    
    respond_to do |wants|
      if server.save
          flash[:notice] = "Le serveur a été sauvegardé avec succès."
          wants.html { redirect_to servers_path}
      else
        flash[:notice] = "Le serveur saisi n'a pus être sauvegardé."
        wants.html {render new_server_path}
      end
    end
  end
  
  def show
    @server = Server.find(params[:id])
  end
  
  def edit
    @server = Server.find(params[:id])
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
