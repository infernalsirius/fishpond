class ModelNumbersController < ApplicationController
  before_filter :require_user
  layout "dark"
  
  def method_name
    @modelNumbers = ModelNumber.paginate(:per_page => 10, :page => params[:page])
  end
  def new
   # @modelNumbers = ModelNumber.paginate(:per_page => 10, :page => params[:page])
    @modelNumber = ModelNumber.new
  end
  
  def create
    @modelNumber = ModelNumber.new(params[:modelNumber])
    
    respond_to do |wants|
      if @modelNumber.save
        flash[:notice] = "Le numéro de modèle à été sauvegarder avec succès."
        wants.html { redirect_back_or_default(new_hardware_path) }
      else
        flash[:notice] = "Le numéro de modèle n'a pu être sauvegardé."
        wants.html { render new_model_number_path, :layout => "dark" }
      end
    end
  end
end
