require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/meetings/index.html.haml" do
  include MeetingsHelper
  
  before(:each) do
    assigns[:meetings] = [
      stub_model(Meeting,
        :venue => "value for venue"
      ),
      stub_model(Meeting,
        :venue => "value for venue"
      )
    ]
  end

  it "should render list of meetings" do
    render "/meetings/index.html.haml"
    response.should have_tag("tr>td", "value for venue", 2)
  end
end

