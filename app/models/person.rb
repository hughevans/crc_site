class Person < ActiveRecord::Base

  has_gravatar
  
  validates_length_of     :email, :within  => 6..250
  validates_uniqueness_of :email, :case_sensitive => false,
                                  :message => 'is already registered'
  validates_email_format_of :email
  
end
