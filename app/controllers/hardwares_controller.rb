class HardwaresController < ApplicationController
  def index
    @allhardware = Hardware.find(:all)
  end
end
