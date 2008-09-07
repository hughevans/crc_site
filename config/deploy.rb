require 'yaml'

# Keep any security-related or server-specific info out of source control.
DEPLOY_CONFIG = YAML.load(File.read(RAILS_ROOT + "/config/deploy.yml"))

set :application,             'canberraruby.com'

role :app,                    DEPLOY_CONFIG['app_server']
role :web,                    DEPLOY_CONFIG['app_server']
role :db,                     DEPLOY_CONFIG['app_server'], :primary => true
ssh_options[:port] =          DEPLOY_CONFIG['ssh_port']
set :use_sudo,                DEPLOY_CONFIG['use_sudo']
                              
set :scm,                     'git'
set :repository,              'git://github.com/artpop/crc_site.git'
set :deploy_to,               DEPLOY_CONFIG['deploy_to']
default_run_options[:pty] =   true # For git password prompts

namespace :page_cache do
  desc 'Set up a crontab entry to sweep the page cache every 12 hours'
  task :add_crontab_entry, :roles => :app do
    tmpname = "/tmp/canberraruby-crontab.#{Time.now.to_f.to_s}"
    # Run `crontab -l || echo ''` because the crontab command will fail if the user has no pre-existing crontab file.
    # In this case, `echo ''` will print a blank line, which is the same as a non-existing crontab anyway.
    run "(crontab -l || echo '') | grep -v 'rake ts:in' > #{tmpname}"
    run "echo '0 2 * * * cd #{current_path} && RAILS_ENV=production rake ts:in' >> #{tmpname}"
    run "crontab #{tmpname}"
    run "rm #{tmpname}"
  end
end