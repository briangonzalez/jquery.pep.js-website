# further requires (models, helpers, core extensions etc. 
Dir.glob('./application/**/*.rb') do |file|
  require file
end

configure do
  set :demos_path,        File.join( settings.views, 'demos.yml' ) 
  set :demos,             YAML.load_file( settings.demos_path  )

  set :demos_alt_path,    File.join( settings.views, 'demos_alt.yml' )
  set :demos_alt,         YAML.load_file( settings.demos_alt_path )

  set :pep_manifest_path, './public/javascripts/pep/package.json'
  set :pep_manifest,      JSON.parse( IO.read(settings.pep_manifest_path) )

  puts settings.pep_manifest

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