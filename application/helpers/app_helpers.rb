# ================
# = App Helpers  =
# ================
module Sinatra
  module AppHelpers

    #   This method slurps in the settings from app.yaml, and places them in 
    #   Sinatra's constant: `settings`. Then you can access them from anywhere via 
    #
    #     app(:some_constant)
    #
    def app(key)
      settings.app_values[key.to_s]
    end

    def demos
      if Sinatra::Base.development?
        YAML.load_file( File.join( settings.views, 'demos.yml' )  )
      else
        settings.demos
      end
    end

  end

  helpers AppHelpers
end