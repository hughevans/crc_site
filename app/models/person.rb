class Person < ActiveRecord::Base
  
  validates_length_of     :email, :within  => 6..250
  validates_uniqueness_of :email, :case_sensitive => false,
                                  :message => 'is already registered'
  
end
