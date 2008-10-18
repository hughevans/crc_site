require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MeetingsController do

  def mock_meeting(stubs={})
    @mock_meeting ||= mock_model(Meeting, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all meetings as @meetings" do
      Meeting.should_receive(:find).with(:all).and_return([mock_meeting])
      get :index
      assigns[:meetings].should == [mock_meeting]
    end

    describe "with mime type of xml" do
  
      it "should render all meetings as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Meeting.should_receive(:find).with(:all).and_return(meetings = mock("Array of Meetings"))
        meetings.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested meeting as @meeting" do
      Meeting.should_receive(:find).with("37").and_return(mock_meeting)
      get :show, :id => "37"
      assigns[:meeting].should equal(mock_meeting)
    end
    
    describe "with mime type of xml" do

      it "should render the requested meeting as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Meeting.should_receive(:find).with("37").and_return(mock_meeting)
        mock_meeting.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new meeting as @meeting" do
      Meeting.should_receive(:new).and_return(mock_meeting)
      get :new
      assigns[:meeting].should equal(mock_meeting)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested meeting as @meeting" do
      Meeting.should_receive(:find).with("37").and_return(mock_meeting)
      get :edit, :id => "37"
      assigns[:meeting].should equal(mock_meeting)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created meeting as @meeting" do
        Meeting.should_receive(:new).with({'these' => 'params'}).and_return(mock_meeting(:save => true))
        post :create, :meeting => {:these => 'params'}
        assigns(:meeting).should equal(mock_meeting)
      end

      it "should redirect to the created meeting" do
        Meeting.stub!(:new).and_return(mock_meeting(:save => true))
        post :create, :meeting => {}
        response.should redirect_to(meeting_url(mock_meeting))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved meeting as @meeting" do
        Meeting.stub!(:new).with({'these' => 'params'}).and_return(mock_meeting(:save => false))
        post :create, :meeting => {:these => 'params'}
        assigns(:meeting).should equal(mock_meeting)
      end

      it "should re-render the 'new' template" do
        Meeting.stub!(:new).and_return(mock_meeting(:save => false))
        post :create, :meeting => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested meeting" do
        Meeting.should_receive(:find).with("37").and_return(mock_meeting)
        mock_meeting.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :meeting => {:these => 'params'}
      end

      it "should expose the requested meeting as @meeting" do
        Meeting.stub!(:find).and_return(mock_meeting(:update_attributes => true))
        put :update, :id => "1"
        assigns(:meeting).should equal(mock_meeting)
      end

      it "should redirect to the meeting" do
        Meeting.stub!(:find).and_return(mock_meeting(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(meeting_url(mock_meeting))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested meeting" do
        Meeting.should_receive(:find).with("37").and_return(mock_meeting)
        mock_meeting.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :meeting => {:these => 'params'}
      end

      it "should expose the meeting as @meeting" do
        Meeting.stub!(:find).and_return(mock_meeting(:update_attributes => false))
        put :update, :id => "1"
        assigns(:meeting).should equal(mock_meeting)
      end

      it "should re-render the 'edit' template" do
        Meeting.stub!(:find).and_return(mock_meeting(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested meeting" do
      Meeting.should_receive(:find).with("37").and_return(mock_meeting)
      mock_meeting.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the meetings list" do
      Meeting.stub!(:find).and_return(mock_meeting(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(meetings_url)
    end

  end

end
