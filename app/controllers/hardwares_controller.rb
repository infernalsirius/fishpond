class HardwaresController < ApplicationController
  def index
    @allhardware = Hardware.find(:all)
    
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
        flash[:notice] = 'Le matériel a été sauvegardé avec succès'
        wants.html
      else
        wants.html { render new_hardware_path }
      end
    end
  end
  
  def update
    @hardware = Hardware.find(params[:id])
    
    respond_to do |wants|
      if @hardware.update_attributes(params[:hardware])
        wants.html          
      else
        wants.html { render edit_hardware_path }
      end
    end
  end
  
  def destroy
    @hardware = Hardware.find(params[:id])
    @hardware.destroy
    
    respond_to do |wants|
      wants.html { redirect_back_or_default }
    end
  end
  
end
