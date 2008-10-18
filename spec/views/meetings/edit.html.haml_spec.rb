require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meetings/edit.html.haml" do
  include MeetingsHelper
  
  before(:each) do
    assigns[:meeting] = @meeting = stub_model(Meeting,
      :new_record? => false,
      :venue => "value for venue"
    )
  end

  it "should render edit form" do
    render "/meetings/edit.html.haml"
    
    response.should have_tag("form[action=#{meeting_path(@meeting)}][method=post]") do
      with_tag('input#meeting_venue[name=?]', "meeting[venue]")
    end
  end
end


