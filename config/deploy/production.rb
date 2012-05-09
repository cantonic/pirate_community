server 'pirates.cantonic.com', :app, :web, :primary => true
set :branch, "master"
set :deploy_to, "/home/deployer/apps/#{application}_production"

default_environment["PATH"]         = "/usr/local/rvm/gems/ruby-1.9.3-p194@pirate_community_production/bin:/usr/local/rvm/gems/ruby-1.9.3-p194@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p194/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
default_environment["GEM_HOME"]     = "/usr/local/rvm/gems/ruby-1.9.3-p194@pirate_community_production"
default_environment["GEM_PATH"]     = "/usr/local/rvm/gems/ruby-1.9.3-p194@pirate_community_production:/usr/local/rvm/gems/ruby-1.9.3-p194@global"

desc "Zero-downtime restart of Unicorn"
task :restart, :except => { :no_release => true } do
  run "test -f /tmp/unicorn.#{application}_production.pid && kill -s USR2 `cat /tmp/unicorn.#{application}_production.pid`"
end


desc "Start unicorn"
task :start, :except => { :no_release => true } do
  run "cd #{current_path} ; bundle exec unicorn -c config/unicorn_production.rb -D"
end

desc "Stop unicorn"
task :stop, :except => { :no_release => true } do
  run "kill -s QUIT `cat /tmp/unicorn.#{application}_production.pid`"
end