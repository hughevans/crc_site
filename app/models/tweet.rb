require 'open-uri'
require 'ostruct'

class Tweet < OpenStruct
  def self.all
    users         = Person.all(:select => 'twitter_user', :conditions => 'twitter_user IS NOT NULL')
    query_string  = users.inject('q=') { |str, person| str += "from%3A#{person.twitter_user}+OR+" }
    feed          = Hpricot(open("http://search.twitter.com/search.atom?#{query_string.gsub(/\+OR\+$/, '')}"))
    
    (feed/'entry').map { |e| Tweet.new(
      :from => (e/'name').inner_html,
      :text => (e/'title').inner_html,
      :link => (e/'link').first['href'],
      :date => Time.parse((e/'published').inner_html)
    )}
  end
end