class LocationsController < ApplicationController
  before_filter :require_user
  layout 'dark'
  
  def index
    @locations = Location.paginate(:per_page => 10, :page => params[:page])
    
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
      if @location.save
          flash[:notice] = "L'emplacement a été sauvegardé avec succès."
          wants.html { redirect_to locations_path}
      else
        flash[:notice] = "L'emplacement saisi n'a pus être sauvegardé."
        wants.html {render new_location_path, :layout => 'dark'}
      end
    end
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
