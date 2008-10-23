require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/topics/edit.html.erb" do
  include TopicsHelper
  
  before(:each) do
    assigns[:topic] = @topic = stub_model(Topic,
      :new_record? => false,
      :title => "value for title",
      :description => "value for description",
      :link => "value for link",
    )
  end

  it "should render edit form" do
    render "/topics/edit.html.erb"
    
    response.should have_tag("form[action=#{topic_path(@topic)}][method=post]") do
      with_tag('input#topic_title[name=?]', "topic[title]")
      with_tag('textarea#topic_description[name=?]', "topic[description]")
      with_tag('input#topic_link[name=?]', "topic[link]")
    end
  end
end


