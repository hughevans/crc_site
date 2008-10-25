class Topic < ActiveRecord::Base
  belongs_to :meeting
  
  validates_presence_of :title
  validates_presence_of :description
end
