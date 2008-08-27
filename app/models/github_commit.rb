class GithubCommit < Hash
  BASE_URL = "http://github.com/api/v1/json"
  
  def self.all
    users   = Person.all(:select => 'github_user', :conditions => 'github_user IS NOT NULL')
    repos   = []
    commits = []

    # Grab each user's info and put their repositories into the stack
    users.each do |u|
      JSON.parse(open("#{BASE_URL}/#{u.github_user}").read)['user']['repositories'].each do |r|
        repos << r['url'].gsub('http://github.com/', '') if r['description'] =~ /#crc/
      end
    end

    # Get the latest commits for each repo
    repos.each do |r|
      JSON.parse(open("#{BASE_URL}/#{r}/commits/master").read)['commits'].each do |c|
        commits << GithubCommit.new.merge(c)
      end
    end

    commits.sort do |a, b|
      Time.parse(b['committed_date']) <=> Time.parse(a['committed_date'])
    end
  end
  
  def project_name
    self['url'].split('/')[4]
  end
  
  def project_url
    self['url'].gsub(/\/commit.*$/, '')
  end
  
  def author_name
    self['author']['name']
  end
  
  def message
    self['message']
  end
  
  def url
    self['url']
  end
  
  def commit_id
    self['id']
  end
end