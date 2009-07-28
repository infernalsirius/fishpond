class LocationsController < ApplicationController
  def index
    @locations = Location.find(:all)
    
    respond_to do |wants|
      wants.html
    end
  end
  
  def new
    @location = Location.new
  end
  
  def create
    @location = Location.new(params[:location])
    
    respond_to do |wants|
      if license.save
          flash[:notice] = "L'emplacement a été sauvegardé avec succès."
          wants.html { redirect_to location_path}
        end
      else
        flash[:notice] = "L'emplacement saisi n'a pus être sauvegardé."
        wants.html {render new_location_path}
      end
    end
  end
  
  def show
    @location = Location.find(params[:id])
  end
  
  def edit
    @location = Location.find(params[:id])
  end
  
  def update
    @location = Location.find(params[:id])
    
    respond_to do |wants|
      if @location.update_attributes(params[:location])
        wants.html { redirect_to locations_path }
      else
        flash[:notice] = "L'emplacement n'a pu être mis à jour."
        wants.html { render edit_location_path(params[:id]) }
      end
    end
  end
  
  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    
    respond_to do |wants|
      wants.html { redirect_to locations_path }
    end
  end
end
