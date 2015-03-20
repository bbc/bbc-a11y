require 'webrick'

class WebServer
  DOCUMENT_ROOT = File.expand_path File.dirname(__FILE__) + '/web_server'
  class << self
    def ensure_running_on(port)
      return if @running
      server = WEBrick::HTTPServer.new options(port)
      Thread.new { server.start }
      at_exit { server.shutdown }
      @running = true
    end

    def options(port)
      {
        :Port => port.to_i, 
        :DocumentRoot => DOCUMENT_ROOT, 
        :AccessLog => [], 
        :Logger => WEBrick::Log::new("/dev/null", 7)
      }
    end
  end
end
