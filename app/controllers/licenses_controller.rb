class LicensesController < ApplicationController
  load_and_authorize_resource
  before_filter :require_user
  auto_complete_for :license, :software
  auto_complete_for :license, :licenseType
  auto_complete_for :license, :maker
  layout 'dark'
  
  def index
    @search = License.search(params[:search])
    @licenses = @search.all.paginate(:per_page => 15, :page => params[:page])
    
    respond_to do |wants|
      wants.html
      
      wants.pdf { render :layout => false}
    end
  end
  
  def new
    languages
    @license = License.new
    @hardwares = Hardware.find(:all)
    @servers = Server.find(:all)
    @os = OperatingSystem.find(:all)
    @licenses = License.find(:all)
  end
  
  def create
    @license = License.new(params[:license])
    @hardwares = Hardware.find(:all)
    @servers = Server.find(:all)
    @os = OperatingSystem.find(:all)
    
    respond_to do |wants|
      if @license.save!
          flash[:notice] = "La license a été sauvegardée avec succès."
          wants.html { redirect_to licenses_path}
      else
        flash[:notice] = "La license saisie n'a pus être sauvegardée."
        wants.html {redirect_to licenses_path}
      end
    end
  end
  
  def show
    @license = License.find(params[:id])
    
    respond_to do |wants|
      wants.html
    end
  end
  
  def taco
    @os = OperatingSystem.find(:all)
  end
  
  def clonage
    @license = License.find(params[:id])
    @hardwares = Hardware.find(:all)
    @servers = Server.find(:all)
    @os = OperatingSystem.find(:all)
    languages
    
    @license.serial = ""
  end
  
  def create_clone
    @license = License.new(params[:license])
    @clone_license = @license.clone
    
    respond_to do |wants|
      if @clone_license.save!
        wants.html { redirect_to licenses_path }
      else
        flash[:notice] = "La license n'a pu être dupliquée."
        wants.html { render clonage_license_path(params[:id]) }
      end
    end
  end
  
  def edit
    @license = License.find(params[:id])
    @hardwares = Hardware.find(:all)
    @servers = Server.find(:all)
    @os = OperatingSystem.find(:all)
    languages
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
