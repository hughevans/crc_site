class CommitsController < ApplicationController
  caches_page :index
  
  def index
    @commits = GithubCommit.all
    
    respond_to do |format|
      format.html
    end
  end
end