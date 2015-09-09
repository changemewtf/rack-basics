class Application
  def call env
    return [
      302,
      { 'Location' => 'http://www.google.com' },
      [ '' ]
    ]
  end
end

if __FILE__ == $0
  require 'rack'
  Rack::Handler::WEBrick.run Application.new
end
