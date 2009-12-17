class HardwaresController < ApplicationController
  before_filter :require_user
  layout 'dark'
  
  def index
    @hardwares = Hardware.paginate(:per_page => 10, :page => params[:page])
        
    respond_to do |wants|
      wants.html
    end
  end
  
  def show
    @hardware = Hardware.find(params[:id])
    
    respond_to do |wants|
      wants.html
    end
  end
  
  def new
    @hardware = Hardware.new
    @maker = Maker.new
    @departments = Department.find(:all)
    @makers = Maker.find(:all)
    @locations = Location.find(:all)
    @modelnums = ModelNumber.find(:all)
    
    respond_to do |wants|
      wants.html
    end
  end
  
  def create
    @hardware = Hardware.new(params[:hardware])
    @departments = Department.find(:all)
    @locations = Location.find(:all)
    @makers = Maker.find(:all)
    @modelnums = ModelNumber.find(:all)
    
    respond_to do |wants|
      if @hardware.save
        flash[:notice] = "Le matériel a été sauvegardé avec succès"
        wants.html { redirect_to hardwares_path }
      else
        flash[:notice] = "Le matériel n'a pas été sauvegardé"
        wants.html { render new_hardware_path, :layout => 'dark' }
      end
    end
  end
  
  def edit
    @hardware = Hardware.find(params[:id])
    @makers = Maker.find(:all)
    @modelnums = ModelNumber.find(:all)
    
    respond_to do |wants|
      wants.html
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
