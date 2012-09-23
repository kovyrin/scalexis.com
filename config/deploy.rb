#############################################################
# Servers
#############################################################
server 'hosting.kovyrin.net', :app, :db, :web, :primary => true
set :user, 'kovyrin'
set :use_sudo, false

#############################################################
# Configuration
#############################################################
set :application, "scalexis.com"
set :deploy_to, "/home/hosting/kovyrin/scalexis.com"
set :keep_releases, 10

#############################################################
# Settings
#############################################################
default_run_options[:pty] = true

#############################################################
# Git
#############################################################
set :repository, "git@github.com:kovyrin/scalexis.com.git"
set :scm, :git
set :scm_verbose, false
set :branch, ENV['BRANCH'] || 'master'

#############################################################
# Deploy Tasks
#############################################################
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart do ; end
  task :finalize_update do
    run "rm -f #{release_path}/Capfile #{release_path}/config/deploy.rb"
  end
end

#############################################################
# Hooks
#############################################################

# This is VERY slow operation, so it should be the LAST
after :deploy, 'deploy:cleanup'

