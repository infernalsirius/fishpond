require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Critical do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Critical.create!(@valid_attributes)
  end
end
