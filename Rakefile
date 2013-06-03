# The default, if you just run `rake` in this directory, will list all the available tasks
task :default do
  puts "All available rake tasks"
  system('rake -T')
end

desc "Start Thin in development mode"
task :start do
  system("bundle exec thin start -R config.ru -p 1960")
end