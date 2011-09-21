load 'deploy'

# Capistrano configuration
server 'linode.kovyrin.net', :app, :web, :db, :primary => true

set :application, 'scalexis.com'
set :repository,  'git@github.com:kovyrin/scalexis.com.git'
set :deploy_to, '/home/hosting/kovyrin/scalexis.com'

# Deploy params
set :scm, 'git'
set :branch, ENV['BRANCH'] || 'master'
set :deploy_via, :remote_cache
set :scm_verbose, true

# User info
set :use_sudo, false
set :user, 'kovyrin'

# Capistrano tasks
namespace :deploy do
  desc 'Tasks to execute after code update'
  task :after_update_code, :roles => :app do
    run "chown kovyrin:hosting #{release_path} -R"
  end
  
  desc 'No finalization needed'
  task :finalize_update do
  end
  
  desc 'No restarting needed'
  task :restart do
  end
end
