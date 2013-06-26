# further requires (models, helpers, core extensions etc. 
Dir.glob('./application/**/*.rb') do |file|
  require file
end

configure do
  set :demos, YAML.load_file( File.join( settings.views, 'demos.yml' )  )

  set :pep_path, './public/javascripts/pep/dist/jquery.pep.min.js'
  `tar -cvzf #{settings.pep_path}.gz #{settings.pep_path}`
  set :pep_size, File.size("#{settings.pep_path}.gz")/1000
end

helpers do
  def pep_size
    settings.pep_size
  end
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