require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meetings/show.html.haml" do
  include MeetingsHelper
  
  before(:each) do
    assigns[:meeting] = @meeting = stub_model(Meeting,
      :venue => "value for venue"
    )
  end

  it "should render attributes in <p>" do
    render "/meetings/show.html.haml"
    response.should have_text(/value\ for\ venue/)
  end
end

