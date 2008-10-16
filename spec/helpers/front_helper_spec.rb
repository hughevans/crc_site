require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FrontHelper do
  include FrontHelper
  
  # TODO: change the tests so that it is not tied to the particular day of the week
  describe "next_meeting_date (Wednesday)" do
    
    it "should return last Wednesday for month ending on a Wednesday" do
      mock_today = Date.new(2008,12,1)
      last_wednesday = mock_today.end_of_month
      1.upto(31) { |d|
        Date.stub!(:today).and_return(mock_today)
        next_meeting_date.should eql(last_wednesday)      
        mock_today += 1.day
      }
    end

    it "should return last Wednesday for month ending on a Thursday" do
      mock_today = Date.new(2008,7,1)
      last_wednesday = mock_today.end_of_month - 1.day
      1.upto(31) { |d|
        Date.stub!(:today).and_return(mock_today)
        next_meeting_date.should eql(last_wednesday)      
        mock_today += 1.day
      }
    end

    it "should return last Wednesday for month ending on a Friday" do
      mock_today = Date.new(2008,10,1)
      last_wednesday = mock_today.end_of_month - 2.days
      1.upto(31) { |d|
        Date.stub!(:today).and_return(mock_today)
        next_meeting_date.should eql(last_wednesday)      
        mock_today += 1.day
      }
    end

    it "should return last Wednesday for month ending on a Saturday" do
      mock_today = Date.new(2008,5,1)
      last_wednesday = mock_today.end_of_month - 3.days
      1.upto(30) { |d|
        Date.stub!(:today).and_return(mock_today)
        next_meeting_date.should eql(last_wednesday)      
        mock_today += 1.day
      }
    end

    it "should return last Wednesday for month ending on a Sunday" do
      mock_today = Date.new(2008,8,1)
      last_wednesday = mock_today.end_of_month - 4.days
      1.upto(31) { |d|
        Date.stub!(:today).and_return(mock_today)
        next_meeting_date.should eql(last_wednesday)      
        mock_today += 1.day
      }
    end
       
    it "should return last Wednesday for month ending on a Monday" do
      mock_today = Date.new(2008,6,1)
      last_wednesday = mock_today.end_of_month - 5.days
      1.upto(30) { |d|
        Date.stub!(:today).and_return(mock_today)
        next_meeting_date.should eql(last_wednesday)      
        mock_today += 1.day
      }
    end

    it "should return last Wednesday for month ending on a Tuesday" do
      mock_today = Date.new(2008,9,1)
      last_wednesday = mock_today.end_of_month - 6.days
      1.upto(30) { |d|      
        Date.stub!(:today).and_return(mock_today)
        next_meeting_date.should eql(last_wednesday)
        mock_today += 1.day     
      }
    end          
  end
end
