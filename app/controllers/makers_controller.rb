class MakersController < ApplicationController
  before_filter :require_user
  layout "dark"
  
  def index
    @makers = Maker.paginate(:per_page => 10, :page => params[:page])
    
    respond_to do |wants|
      wants.html {  }
    end
  end
  
  def new
    @maker = Maker.new 
  end
  
  def create
    @maker = Maker.new(params[:maker])
    
    respond_to do |wants|
      if @maker.save
        flash[:notice] = "Le fabriquant a été sauvegardé avec succès"
        wants.html { redirect_back_or_default(new_hardware_path) }
      else
        flash[:notice] = "Le fabriquant n'a pas été sauvegardé"
        wants.html { render new_maker_path, :layout => 'dark' }
      end
    end
  end
  
  def destroy
    @maker = Maker.find(params[:id])
    
    @maker.destroy
    
    respond_to do |wants|
      wants.html { redirect_to makers_path }
    end
  end
end