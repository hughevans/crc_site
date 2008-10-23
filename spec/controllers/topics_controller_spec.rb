require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TopicsController do

  def mock_topic(stubs={})
    @mock_topic ||= mock_model(Topic, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all topics as @topics" do
      Topic.should_receive(:find).with(:all).and_return([mock_topic])
      get :index
      assigns[:topics].should == [mock_topic]
    end

    describe "with mime type of xml" do
  
      it "should render all topics as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Topic.should_receive(:find).with(:all).and_return(topics = mock("Array of Topics"))
        topics.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested topic as @topic" do
      Topic.should_receive(:find).with("37").and_return(mock_topic)
      get :show, :id => "37"
      assigns[:topic].should equal(mock_topic)
    end
    
    describe "with mime type of xml" do

      it "should render the requested topic as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Topic.should_receive(:find).with("37").and_return(mock_topic)
        mock_topic.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new topic as @topic" do
      Topic.should_receive(:new).and_return(mock_topic)
      get :new
      assigns[:topic].should equal(mock_topic)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested topic as @topic" do
      Topic.should_receive(:find).with("37").and_return(mock_topic)
      get :edit, :id => "37"
      assigns[:topic].should equal(mock_topic)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created topic as @topic" do
        Topic.should_receive(:new).with({'these' => 'params'}).and_return(mock_topic(:save => true))
        post :create, :topic => {:these => 'params'}
        assigns(:topic).should equal(mock_topic)
      end

      it "should redirect to the created topic" do
        Topic.stub!(:new).and_return(mock_topic(:save => true))
        post :create, :topic => {}
        response.should redirect_to(topic_url(mock_topic))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved topic as @topic" do
        Topic.stub!(:new).with({'these' => 'params'}).and_return(mock_topic(:save => false))
        post :create, :topic => {:these => 'params'}
        assigns(:topic).should equal(mock_topic)
      end

      it "should re-render the 'new' template" do
        Topic.stub!(:new).and_return(mock_topic(:save => false))
        post :create, :topic => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested topic" do
        Topic.should_receive(:find).with("37").and_return(mock_topic)
        mock_topic.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :topic => {:these => 'params'}
      end

      it "should expose the requested topic as @topic" do
        Topic.stub!(:find).and_return(mock_topic(:update_attributes => true))
        put :update, :id => "1"
        assigns(:topic).should equal(mock_topic)
      end

      it "should redirect to the topic" do
        Topic.stub!(:find).and_return(mock_topic(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(topic_url(mock_topic))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested topic" do
        Topic.should_receive(:find).with("37").and_return(mock_topic)
        mock_topic.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :topic => {:these => 'params'}
      end

      it "should expose the topic as @topic" do
        Topic.stub!(:find).and_return(mock_topic(:update_attributes => false))
        put :update, :id => "1"
        assigns(:topic).should equal(mock_topic)
      end

      it "should re-render the 'edit' template" do
        Topic.stub!(:find).and_return(mock_topic(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested topic" do
      Topic.should_receive(:find).with("37").and_return(mock_topic)
      mock_topic.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the topics list" do
      Topic.stub!(:find).and_return(mock_topic(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(topics_url)
    end

  end

end
