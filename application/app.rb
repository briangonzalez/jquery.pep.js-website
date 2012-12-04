# further requires (models, helpers, core extensions etc. { but not 'middleware' because that should be grabbed up by Rack when appropriate })
Dir.glob('./application/**/*.rb') do |file|
  require file
end

before do
  # opt into the future
  response['X-UA-Compatible'] = "IE=edge,chrome=1"
  cache_control :public, max_age: 2592000  # 1 month
end

get '/' do
  @title          = app(:site)
  @title_tertiary = app(:tagline)
  haml :index
end

get '/about' do
  @title    = 'about'
  @tagline  = "a lil' about me" 
  haml :about
end

get '/contact' do
  @title    = 'contact'
  @tagline  = "say hello" 
  haml :contact
end