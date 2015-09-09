class Application
  def call env
    return [
      200,
      { 'Content-Type' => 'text/plain' },
      [ 'Hello, world!' ]
    ]
  end
end

if __FILE__ == $0
  require 'rack'
  require '06-Middleware'
  app = Application.new
  app = PrintRequestMiddleware.new(app)
  Rack::Handler::WEBrick.run app
end
