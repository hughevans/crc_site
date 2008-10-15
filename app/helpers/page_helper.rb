module PageHelper
  
  # TODO: should be made customisable
  MEETING_WDAY = 3        # Wednesday
  
  # returns the date for the next meeting
  def next_meeting_date
    last_day_of_month = Date.today.end_of_month
    total = last_day_of_month.wday + MEETING_WDAY + 1
    total -= 7 if total >= 7
    return last_day_of_month - total.days
  end
  
end
