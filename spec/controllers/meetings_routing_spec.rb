require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MeetingsController do
  describe "route generation" do

    it "should map { :controller => 'meetings', :action => 'index' } to /meetings" do
      route_for(:controller => "meetings", :action => "index").should == "/meetings"
    end
  
    it "should map { :controller => 'meetings', :action => 'new' } to /meetings/new" do
      route_for(:controller => "meetings", :action => "new").should == "/meetings/new"
    end
  
    it "should map { :controller => 'meetings', :action => 'show', :id => 1 } to /meetings/1" do
      route_for(:controller => "meetings", :action => "show", :id => 1).should == "/meetings/1"
    end
  
    it "should map { :controller => 'meetings', :action => 'edit', :id => 1 } to /meetings/1/edit" do
      route_for(:controller => "meetings", :action => "edit", :id => 1).should == "/meetings/1/edit"
    end
  
    it "should map { :controller => 'meetings', :action => 'update', :id => 1} to /meetings/1" do
      route_for(:controller => "meetings", :action => "update", :id => 1).should == "/meetings/1"
    end
  
    it "should map { :controller => 'meetings', :action => 'destroy', :id => 1} to /meetings/1" do
      route_for(:controller => "meetings", :action => "destroy", :id => 1).should == "/meetings/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'meetings', action => 'index' } from GET /meetings" do
      params_from(:get, "/meetings").should == {:controller => "meetings", :action => "index"}
    end
  
    it "should generate params { :controller => 'meetings', action => 'new' } from GET /meetings/new" do
      params_from(:get, "/meetings/new").should == {:controller => "meetings", :action => "new"}
    end
  
    it "should generate params { :controller => 'meetings', action => 'create' } from POST /meetings" do
      params_from(:post, "/meetings").should == {:controller => "meetings", :action => "create"}
    end
  
    it "should generate params { :controller => 'meetings', action => 'show', id => '1' } from GET /meetings/1" do
      params_from(:get, "/meetings/1").should == {:controller => "meetings", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'meetings', action => 'edit', id => '1' } from GET /meetings/1;edit" do
      params_from(:get, "/meetings/1/edit").should == {:controller => "meetings", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'meetings', action => 'update', id => '1' } from PUT /meetings/1" do
      params_from(:put, "/meetings/1").should == {:controller => "meetings", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'meetings', action => 'destroy', id => '1' } from DELETE /meetings/1" do
      params_from(:delete, "/meetings/1").should == {:controller => "meetings", :action => "destroy", :id => "1"}
    end
  end
end
