class Application
  def call env
    case env['REQUEST_PATH']
    when '/favicon.ico'
      return [404, { 'Content-Type' => 'text/plain' }, ['Not found.']]
    when '/'
      return [200, { 'Content-Type' => 'text/plain' }, ['You found the index page!']]
    else
      return [200, { 'Content-Type' => 'text/plain' }, ['What is that?!']]
    end
  end
end

if __FILE__ == $0
  require 'rack'
  Rack::Handler::WEBrick.run Application.new
end
