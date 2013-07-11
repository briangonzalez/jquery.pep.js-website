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
        YAML.load_file( settings.demos_path  )
      else
        settings.demos
      end
    end

    def demos_alt
      if Sinatra::Base.development?
        YAML.load_file( settings.demos_alt_path  )
      else
        settings.demos_alt
      end
    end

    def version
      settings.pep_manifest['version']
    end

  end

  helpers AppHelpers
end