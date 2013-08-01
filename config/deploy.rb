default_run_options[:pty] = true
set :user, 'huatu'
set :domain, 'qq.vstudy.cn'
set :application, 'qqlist'

set :repository,  "#{user}@#{domain}:/home/www/src/#{application}.git"
set :deploy_to, "/home/www/#{domain}/"

role :web, "#{user}@#{domain}"                          # Your HTTP server, Apache/etc
role :app, "#{user}@#{domain}"                          # This may be the same as your `Web` server
role :db, "#{user}@#{domain}", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :scm, :git
set :branch, :master
set :scm_verbose, true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  after 'deploy:update_code', 'deploy:assets_precompile'
  desc 'Precompile assets to public/assets/'
  task :assets_precompile, :roles => :app do
    run "cd #{release_path}; bundle install"
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  end
end
