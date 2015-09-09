require 'rack'
require 'erb'
require 'base64'

class Application
  def initialize
    @uploadedFile = nil
  end

  def call env
    req = Rack::Request.new(env)
    template = ERB.new File.read('05-index.html.erb')

    case env['REQUEST_PATH']
    when '/'
      return [200, { 'Content-Type' => 'text/html' }, [template.result(binding)]]
    when '/upload'
      file = req.POST['uploadedFile']
      @uploaded_file_data = file[:tempfile].read
      @uploaded_file_type = file[:type]
      return [302, { 'Location' => '/' }, ['']]
    end
  end

  def uploaded_file_data_url
    base64_data = Base64.encode64(@uploaded_file_data).chop
    "data:#{@uploaded_file_type};base64,#{base64_data}"
  end
end

if __FILE__ == $0
  Rack::Handler::WEBrick.run Application.new
end
