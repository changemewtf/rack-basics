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
  Rack::Handler::WEBrick.run Application.new
end
