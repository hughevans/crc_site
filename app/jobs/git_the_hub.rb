require 'open-uri'
require 'time'

BASE_URL = "http://github.com/api/v1/json"

users   = Person.all(:select => 'github_user', :conditions => 'github_user IS NOT NULL')
repos   = []
commits = []

# Grab each user's info and put their repositories into the stack
users.each do |u|
  JSON.parse(open("#{BASE_URL}/#{u}").read)['user']['repositories'].each do |r|
    repos << r['url'].gsub('http://github.com/', '')
  end
end

# Get the latest commits for each repo
repos.each do |r|
  JSON.parse(open("#{BASE_URL}/#{r}/commits/master").read)['commits'].each do |c|
    commits << c
  end
end

commits.sort! do |a, b|
  Time.parse(b['committed_date']) <=> Time.parse(a['committed_date'])
end

p commits