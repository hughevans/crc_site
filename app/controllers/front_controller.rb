class FrontController < ApplicationController
  caches_page :index
  
  def index
    @tweets = Tweet.all
  end
end
