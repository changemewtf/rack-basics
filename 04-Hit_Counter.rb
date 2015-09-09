require 'erb'

class Application
  def initialize
    @hits = 0
  end

  def call env
    case env['REQUEST_PATH']
    when '/favicon.ico'
      return [404, { 'Content-Type' => 'text/plain' }, ['Not found.']]
    when '/'
      @hits += 1

      template = ERB.new File.read('04-index.html.erb')
      body = template.result binding

      return [200, { 'Content-Type' => 'text/html' }, [body]]
    end
  end
end

if __FILE__ == $0
  require 'rack'
  Rack::Handler::WEBrick.run Application.new
end
