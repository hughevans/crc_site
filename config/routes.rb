ActionController::Routing::Routes.draw do |map|
  map.resources :meetings


  map.commits '/hacks', :controller => 'commits'

  map.site '/:name', :controller => 'page', :action => 'show'
    
  map.root :controller => 'front', :action => 'index'

end
