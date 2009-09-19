Class MakersController < ApplicationController
  
  def create
    @maker = Maker.new(params[:maker])
    
    respond_to do |wants|
      if @model.save
        flash[:notice] = 'Model was successfully created.'
        wants.rjs {}
      else
        wants.html { render :action => "new" }
        wants.xml { render :xml => @model.errors, :status => :unprocessable_entity }
      end
    end
  end
    
end
