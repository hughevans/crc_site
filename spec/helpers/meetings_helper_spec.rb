require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MeetingsHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(MeetingsHelper)
  end
  
  # describe "admin_only" do
  #   it "should yield if logged in user is an admin" do
  #     @content_block = "Inside the content block"
  #     result = helper.admin_only { @content_block }
  #     result.should_not equal(@content_block)
  #   end
  #   it "should NOT yield if user is not logged in" do
  #     
  #   end
  #   it "should NOT yield if logged in user is not an admin" do
  #     
  #   end
  # end
  
end
