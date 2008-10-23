require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Topic do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :description => "value for description",
      :link => "value for link",
      :meeting_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Topic.create!(@valid_attributes)
  end
end
