ActionController::Routing::Routes.draw do |map|
  map.resources :topics

  map.resources :meetings

  map.resources :users

  map.open_id_complete 'opensession', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  map.open_id_create 'opencreate', :controller => "users", :action => "create", :requirements => { :method => :get }
  map.resource :session
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login',  :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  

  map.commits '/hacks', :controller => 'commits'

  map.site '/:name', :controller => 'page', :action => 'show'
    
  map.root :controller => 'front', :action => 'index'

end
