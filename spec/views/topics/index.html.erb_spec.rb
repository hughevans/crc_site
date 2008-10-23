require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/topics/index.html.erb" do
  include TopicsHelper
  
  before(:each) do
    assigns[:topics] = [
      stub_model(Topic,
        :title => "value for title",
        :description => "value for description",
        :link => "value for link",
      ),
      stub_model(Topic,
        :title => "value for title",
        :description => "value for description",
        :link => "value for link",
      )
    ]
  end

  it "should render list of topics" do
    render "/topics/index.html.erb"
    response.should have_tag("tr>td", "value for title", 2)
    response.should have_tag("tr>td", "value for description", 2)
    response.should have_tag("tr>td", "value for link", 2)
  end
end

