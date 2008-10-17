require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FrontHelper do
  include FrontHelper

  describe "next meeting date" do
    before(:each) do
      @mock_today = Date.new(2008,1,1)
    end
    it "should call meeting date helper" do
      Date.stub!(:today).and_return(@mock_today)
      should_receive(:meeting_date).with(@mock_today).and_return(@mock_today)
      next_meeting_date
    end
    it "should format the output" do
      stub!(:meeting_date).and_return(@mock_today)
      @mock_today.should_receive(:to_s).with(:rfc822)
      next_meeting_date
    end
  end
  
  # TODO: change the tests so that it is not tied to the particular day of the week
  describe "meeting date" do
    
    describe "for current month has not passed" do
      it "should return last Wednesday for month ending on a Wednesday" do
        mock_today = Date.new(2008,12,1)
        last_wednesday = mock_today.end_of_month
        meeting_date(mock_today).should eql(last_wednesday)      
      end

      it "should return last Wednesday for month ending on a Thursday" do
        mock_today = Date.new(2008,7,1)
        last_wednesday = mock_today.end_of_month - 1.day
        meeting_date(mock_today).should eql(last_wednesday)      
      end

      it "should return last Wednesday for month ending on a Friday" do
        mock_today = Date.new(2008,10,1)
        last_wednesday = mock_today.end_of_month - 2.days
        meeting_date(mock_today).should eql(last_wednesday)      
      end

      it "should return last Wednesday for month ending on a Saturday" do
        mock_today = Date.new(2008,5,1)
        last_wednesday = mock_today.end_of_month - 3.days
        meeting_date(mock_today).should eql(last_wednesday)      
      end

      it "should return last Wednesday for month ending on a Sunday" do
        mock_today = Date.new(2008,8,1)
        last_wednesday = mock_today.end_of_month - 4.days
        meeting_date(mock_today).should eql(last_wednesday)      
      end
       
      it "should return last Wednesday for month ending on a Monday" do
        mock_today = Date.new(2008,6,1)
        last_wednesday = mock_today.end_of_month - 5.days
        meeting_date(mock_today).should eql(last_wednesday)      
      end

      it "should return last Wednesday for month ending on a Tuesday" do
        mock_today = Date.new(2008,9,1)
        last_wednesday = mock_today.end_of_month - 6.days
        meeting_date(mock_today).should eql(last_wednesday)      
      end
    end
    
    describe "for current month is today" do
      it "should return today as the last Wednesday for the month" do
        mock_today = Date.new(2008,3,26)        # last Wednesday of the month
        last_wednesday = mock_today
        meeting_date(mock_today).should eql(last_wednesday)
      end
    end
    
    describe "for current month has passed" do
      it "should return last Wednesday for next month" do
        mock_today = Date.new(2008,9,25)        # day after the last wednesday
        last_wednesday = Date.new(2008,10,29)   # last wednesday of next month
        meeting_date(mock_today).should eql(last_wednesday)      
      end
    end
    
    describe "is passed an invalid date" do
      it "should return empty string" do
        mock_today = "Today"
        meeting_date(mock_today).should eql("")
      end
    end
    
  end
  
end
