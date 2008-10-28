if config.respond_to?(:gems)
  config.gem 'ruby-openid', :lib => 'openid', :version => '>=2.0.4'
else
  begin
    require 'openid'
  rescue LoadError
    begin
      gem 'ruby-openid', '>=2.0.4'
    rescue Gem::LoadError
      puts "Install the ruby-openid gem to enable OpenID support"
    end
  end
end

config.after_initialize do
  ActionController::Base.send :include, OpenIdAuthentication
end
