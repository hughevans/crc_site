class Meeting < ActiveRecord::Base
  
  has_many    :participations,  :dependent => :destroy
  has_many    :participants,    :through => :participations, :source => :person

  validates_presence_of :date
  validates_presence_of :venue
  
end
