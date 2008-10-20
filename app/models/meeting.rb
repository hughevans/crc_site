class Meeting < ActiveRecord::Base
  
  has_many    :attendances,  :dependent => :destroy
  has_many    :attendees,    :through => :attendances, :source => :person

  validates_presence_of :date
  validates_presence_of :venue
    
end
