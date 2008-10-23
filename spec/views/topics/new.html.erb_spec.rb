require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/topics/new.html.erb" do
  include TopicsHelper
  
  before(:each) do
    assigns[:topic] = stub_model(Topic,
      :new_record? => true,
      :title => "value for title",
      :description => "value for description",
      :link => "value for link",
    )
  end

  it "should render new form" do
    render "/topics/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", topics_path) do
      with_tag("input#topic_title[name=?]", "topic[title]")
      with_tag("textarea#topic_description[name=?]", "topic[description]")
      with_tag("input#topic_link[name=?]", "topic[link]")
    end
  end
end


