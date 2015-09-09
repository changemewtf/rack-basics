require 'awesome_print'

class PrintRequestMiddleware
  def initialize app
    @app = app
  end

  def call env
    ap env
    @app.call env
  end
end
