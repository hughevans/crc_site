require File.dirname(__FILE__) + '/../spec_helper'

module PersonSpecHelper
  
  def valid_person_attributes
    {
      :username    => 'fred_flinstone',
      :name        => 'Fred Flinstone',
      :email       => 'fred@example.com',
      :github_user => 'fred_flinstone'
    }
  end
  
  def valid_email_addresses
    ['jane@example.com', 'gene@example.com', 'dino.dino@example.foo.au']
  end
  
  def invalid_email_addresses
    ['ssjdhfklj@dfslkghjdksfjh.com', 'string']
  end
  
end

describe Person do
  
  include PersonSpecHelper
  
  before(:each) do
    @person = Person.new
  end

  it "should be valid with valid attributes" do
    @person.attributes = valid_person_attributes
    @person.should be_valid
  end
  
  it "should not be valid without an email" do
    @person.attributes = valid_person_attributes.with(:email => nil)
    @person.should have_at_least(1).error_on(:email)
  end
  
  it "should not be valid without a non-unique email"
  
  it "should be valid with a valid and real email" do
    valid_email_addresses.each do |valid_email_address|
      @person.attributes = valid_person_attributes.with(:email => valid_email_address)
      @person.should be_valid
    end
  end
  
  it "should not be valid without a valid and real email" do
    invalid_email_addresses.each do |invalid_email_address|
      @person.attributes = valid_person_attributes.with(:email => invalid_email_address)
      @person.should have_at_least(1).error_on(:email)
    end
  end
  
end
