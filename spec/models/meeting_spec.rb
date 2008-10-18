require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Meeting do
  before(:each) do
    @valid_attributes = {
      :date => Time.now,
      :venue => "value for venue"
    }
  end

  it "should create a new instance given valid attributes" do
    Meeting.create!(@valid_attributes)
  end
end
