class AccessoriesController < ApplicationController
    before_filter :require_user
    layout 'dark'

  def index
    @accessories = Accessory.paginate(:per_page => 10, :page => params[:page])
    
    respond_to do |wants|
      wants.html
    end
  end
  
  def new
    @accessory = Accessory.new
    @hardwares = Hardware.find(:all)
    @servers = Server.find(:all)
    @modelnums = ModelNumber.find(:all)
    @makers = Maker.find(:all)
  end
  
  def create
    @accessory = Accessory.new(params[:accessory])
    @hardwares = Hardware.find(:all)
    @servers = Server.find(:all)
    
    respond_to do |wants|
      if @accessory.save
          flash[:notice] = "Le  périphérique a été sauvegardé avec succès."
          wants.html { redirect_to accessories_path}
      else
        flash[:notice] = "Le périphérique saisi n'a pus être sauvegardé."
        wants.html {render new_accessory_path, :layout => 'dark'}
      end
    end
  end
  
  def show
    @accessory = Accessory.find(params[:id])
  end
  
  def edit
    @accessory = Accessory.find(params[:id])
    @hardwares = Hardware.find(:all)
    @servers = Server.find(:all)
  end
  
  def update
    @accessory = Accessory.find(params[:id])
    
    respond_to do |wants|
      if @accessory.update_attributes(params[:accessory])
        wants.html { redirect_to accessories_path }
      else
        flash[:notice] = "Le périphérique n'a pu être mis à jour."
        wants.html { render edit_accessory_path(params[:id]) }
      end
    end
  end
  
  def destroy
    @accessory = Accessory.find(params[:id])
    @accessory.destroy
    
    respond_to do |wants|
      wants.html { redirect_to accessories_path }
    end
  end
end
