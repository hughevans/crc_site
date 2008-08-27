ActionController::Routing::Routes.draw do |map|

  map.commits '/hacks', :controller => 'commits'

  map.site '/:name', :controller => 'page', :action => 'show'
  
  map.root :controller => 'page', :action => 'show', :name => 'home'
  
end
