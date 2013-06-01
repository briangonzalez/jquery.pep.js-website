# further requires (models, helpers, core extensions etc. 
Dir.glob('./application/**/*.rb') do |file|
  require file
end

configure do
  set :demos, YAML.load_file( File.join( settings.views, 'demos.yml' )  )
end

before do
  # opt into the future
  response['X-UA-Compatible'] = "IE=edge,chrome=1"
  cache_control :public, max_age: 2592000
end

get '/' do
  @title          = app(:site)
  @title_tertiary = app(:tagline)
  haml :index
end

get '/demo' do
  redirect '/', 301
end