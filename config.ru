# = bundle that ish
require 'bundler' # gem requires
Bundler.require(:default)

# core Ruby requires, modules and the main app file
%w(securerandom timeout cgi date ./application/app).each do |requirement|
  require requirement
end

# = Configuration =
set :run,             false
set :show_exceptions, false
set :raise_errors,    development?
set :views,           './application/views'
set :logging,         true
set :static,          true                  # your upstream server should deal with those (nginx, Apache)
set :haml,            :format => :html5

# = Configuration =
app = YAML.load(File.read("app.yaml"))
set :app_values, app

# = map it out for me, boyeeeeiee =
# sprockets
map Sinatra::Application.settings.assets_prefix do
  run Sinatra::Application.sprockets
end

# main app
map '/' do
  run Sinatra::Application
end
