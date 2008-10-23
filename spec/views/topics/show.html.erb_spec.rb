require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/topics/show.html.erb" do
  include TopicsHelper
  
  before(:each) do
    assigns[:topic] = @topic = stub_model(Topic,
      :title => "value for title",
      :description => "value for description",
      :link => "value for link",
    )
  end

  it "should render attributes in <p>" do
    render "/topics/show.html.erb"
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ link/)
  end
end

