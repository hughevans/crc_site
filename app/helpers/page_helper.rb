module PageHelper
  
  # TODO: should be made customisable
  MEETING_WDAY = 3        # Wednesday

  # returns the date for the next meeting from today and formats the output for display
  def next_meeting_date
    meeting_date(Date.today).to_s(:rfc822)
  end
  
  # returns the date for the next meeting after a particular date
  def meeting_date(date)
    last_day_of_month = date.end_of_month
    total = last_day_of_month.wday + MEETING_WDAY + 1
    total -= 7 if total >= 7
    the_meeting_date = last_day_of_month - total.days
    if the_meeting_date < date
      meeting_date(date.next_month.beginning_of_month)
    else
      the_meeting_date
    end
  rescue
    # TODO: what to return if a DateTime is not passed? should I not worry?
    # TODO: maybe allow passing of month number of the current year as an integer
    ""
  end
  
end
