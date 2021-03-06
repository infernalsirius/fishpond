class ModelNumbersController < ApplicationController
  load_and_authorize_resource
  before_filter :require_user
  auto_complete_for :model_number, :name
  layout "dark"
  
  def new
    @modelNumber = ModelNumber.new
  end
  
  def create
    @modelNumber = ModelNumber.new(params[:model_number])
    
    respond_to do |wants|
      if @modelNumber.save!
        flash[:notice] = "Le numéro de modèle à été sauvegarder avec succès."
        wants.html { redirect_back_or_default(new_hardware_path) }
      else
        flash[:notice] = "Le numéro de modèle n'a pu être sauvegardé."
        wants.html { render new_model_number_path, :layout => "dark" }
      end
    end
  end
end
