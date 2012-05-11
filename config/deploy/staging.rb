server '178.79.129.82', :app, :web, :db, :primary => true
set :branch, "develop"
set :deploy_to, "/home/deployer/apps/#{application}_staging"

default_environment["PATH"]         = "/usr/local/rvm/gems/ruby-1.9.3-p194@pirate_community_staging/bin:/usr/local/rvm/gems/ruby-1.9.3-p194@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p194/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
default_environment["GEM_HOME"]     = "/usr/local/rvm/gems/ruby-1.9.3-p194@pirate_community_staging"
default_environment["GEM_PATH"]     = "/usr/local/rvm/gems/ruby-1.9.3-p194@pirate_community_staging:/usr/local/rvm/gems/ruby-1.9.3-p194@global"
default_environment["RUBY_VERSION"] = "ruby-1.9.3-p194 "


default_run_options[:shell] = 'bash'

namespace :deploy do
  desc "Zero-downtime restart of Unicorn"
	task :restart, :except => { :no_release => true } do
	  run "test -f /tmp/unicorn.#{application}_staging.pid && kill -s USR2 `cat /tmp/unicorn.#{application}_staging.pid`"
	end

  desc "Start unicorn"
  task :start, :except => { :no_release => true } do
    run "cd #{current_path} ; bundle exec unicorn -c config/unicorn_staging.rb -D"
  end

  desc "Stop unicorn"
  task :stop, :except => { :no_release => true } do
    run "kill -s QUIT `cat /tmp/unicorn.#{application}_staging.pid`"
  end 
end