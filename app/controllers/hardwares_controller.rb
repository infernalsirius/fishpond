class HardwaresController < ApplicationController
  def index
    @hardwares = Hardware.find(:all)
    
    respond_to do |wants|
      wants.html
    end
  end
  
  def show
    @harware = Hardware.find(params[:id])
    
    respond_to do |wants|
      wants.html
    end
  end
  
  def new
    @hardware = Hardware.new
  end
  
  def edit
    @hardware = Hardware.find(params[:id])
  end
  
  def create
    @hardware = Hardware.new(params[:hardware])
    
    respond_to do |wants|
      if @hardware.save
        flash[:notice] = "Le matériel a été sauvegardé avec succès"
        wants.html { redirect_to hardwares_path }
      else
        flash[:notice] = "Le matériel n'a pas été sauvegardé"
        wants.html { render new_hardware_path }
      end
    end
  end
  
  def update
    @hardware = Hardware.find(params[:id])
    
    respond_to do |wants|
      if @hardware.update_attributes(params[:hardware])
        flash[:notice] = "Le matériel a été modifié"
        wants.html { redirect_to hardwares_path}        
      else
        wants.html { render edit_hardware_path(params[:id]) }
      end
    end
  end
  
  def destroy
    @hardware = Hardware.find(params[:id])
    @hardware.destroy
    
    respond_to do |wants|
      wants.html { redirect_to hardwares_path }
    end
  end
  
end
