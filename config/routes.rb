ActionController::Routing::Routes.draw do |map|

  map.site '/:name', :controller => 'page', :action => 'show'
  
  map.root :controller => 'page', :action => 'show', :name => 'home'
  
end
