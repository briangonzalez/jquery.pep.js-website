# ===================
# = Request Helpers =
# ===================
module Sinatra
  module RequestHelpers

    def underscored_path
      p = request.env['REQUEST_PATH']
      p.slice!(0)
      p.gsub '/', '_'
    end

  end

  helpers RequestHelpers
end