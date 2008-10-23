class Meeting < ActiveRecord::Base
  
  # returns an array of all upcoming meetings from, and including, today in chronological order
  # future.first returns the next meeting
  named_scope :future, :conditions => ['date >= ?', Date.today], :order => 'date'

  # returns an array of all the meetings held before today in order from latest to oldest (reverse chronological order)
  # past.first returns the last held meeting prior to today
  named_scope :past, :conditions => ['date < ?', Date.today], :order => 'date DESC'

  has_many    :topics,       :dependent => :destroy
  has_many    :attendances,  :dependent => :destroy
  has_many    :attendees,    :through => :attendances, :order => :name, :source => :person

  validates_presence_of :date
  validates_presence_of :venue
    
end
