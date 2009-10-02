Class MakersController < ApplicationController
  
  def new
    @maker = Maker.new 
  end
  
  def create
    @maker = Maker.new(params[:maker])
    
    
    
  end
end