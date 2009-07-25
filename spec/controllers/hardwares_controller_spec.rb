require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HardwaresController do

  describe "Get to index" do
    
    before(:each) do
      @allhardware = mock_model(Hardware)
      Hardware.should_receive(:find).with(:all).and_return(@allhardware)
    end
    
    it "should list all the hardware" do
      @allhardware.should_receive(:find).with(:all).and_return(@allhardware)
      assigns[:allhardware].should == [@allhardware]
      get :index
    end
    
  end
end
