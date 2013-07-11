# = bundle that ish
require 'bundler' # gem requires
Bundler.require(:default)

# config
set :run,               false
set :show_exceptions,   development?
set :raise_errors,      development?
set :public_folder,     './public'
set :public_js_folder,  './public/javascripts'
set :app_js_folder,     './application/assets/javascripts'
set :views,             './application/views'
set :logging,           true
set :static,            true                  # your upstream server should deal with those (nginx, Apache)
set :haml,              :format => :html5


# core Ruby requires, modules and the main app file
%w(securerandom timeout cgi date ./application/app).each do |requirement|
  require requirement
end

# site's variables
app = YAML.load(File.read("app.yaml"))
set :app_values, app

# sprockets
map Sinatra::Application.settings.assets_prefix do
  run Sinatra::Application.sprockets
end

# main app
map '/' do
  run Sinatra::Application
end
