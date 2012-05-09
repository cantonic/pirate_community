server 'pirates.cantonic.com', :app, :web, :primary => true
set :branch, "master"

default_environment["PATH"]         = "/usr/local/rvm/gems/ruby-1.9.3-p194@pirate_community_production/bin:/usr/local/rvm/gems/ruby-1.9.3-p194@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p194/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
default_environment["GEM_HOME"]     = "/usr/local/rvm/gems/ruby-1.9.3-p194@pirate_community_production"
default_environment["GEM_PATH"]     = "/usr/local/rvm/gems/ruby-1.9.3-p194@pirate_community_production:/usr/local/rvm/gems/ruby-1.9.3-p194@global"