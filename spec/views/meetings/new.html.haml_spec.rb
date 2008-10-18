require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meetings/new.html.haml" do
  include MeetingsHelper
  
  before(:each) do
    assigns[:meeting] = stub_model(Meeting,
      :new_record? => true,
      :venue => "value for venue"
    )
  end

  it "should render new form" do
    render "/meetings/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", meetings_path) do
      with_tag("input#meeting_venue[name=?]", "meeting[venue]")
    end
  end
end


