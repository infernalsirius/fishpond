class LicensesController < ApplicationController
  before_filter :require_user
  layout 'dark'
  
  def index
    @licenses = License.paginate(:per_page => 10, :page => params[:page])
    
    respond_to do |wants|
      wants.html
    end
  end
  
  def new
    @license = License.new
    @hardwares = Hardware.find(:all)
    @servers = Server.find(:all)
  end
  
  def create
    @license = License.new(params[:license])
    
    respond_to do |wants|
      if @license.save
          flash[:notice] = "La license a été sauvegardée avec succès."
          wants.html { redirect_to licenses_path}
      else
        flash[:notice] = "La license saisie n'a pus être sauvegardée."
        wants.html {render new_license_path}
      end
    end
  end
  
  def show
    @license = License.find(params[:id])
  end
  
  def edit
    @license = License.find(params[:id])
  end
  
  def update
    @license = License.find(params[:id])
    
    respond_to do |wants|
      if @license.update_attributes(params[:license])
        wants.html { redirect_to licenses_path }
      else
        flash[:notice] = "La license n'a pu être mise à jour."
        wants.html { render edit_license_path(params[:id]) }
      end
    end
  end
  
  def destroy
    @license = License.find(params[:id])
    @license.destroy
    
    respond_to do |wants|
      wants.html { redirect_to licenses_path }
    end
  end
end
