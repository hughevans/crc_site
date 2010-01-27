include Gravtastic

class Person < ActiveRecord::Base
  is_gravtastic!

  validates_length_of     :email, :within  => 6..250
  validates_uniqueness_of :email, :case_sensitive => false,
                                  :message => 'is already registered'
  validates_email_format_of :email
  
end
