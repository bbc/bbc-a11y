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
      default = {
        :Port => port.to_i,
        :DocumentRoot => DOCUMENT_ROOT,
      }
      disable_logging = {
        :AccessLog => [],
        :Logger => WEBrick::Log::new("/dev/null", 7)
      }
      unless ENV['DEBUG']
        default.merge disable_logging
      else
        default
      end
    end

    def write_page(path, html)
      full_path = File.join(DOCUMENT_ROOT, path)
      File.open(full_path, 'w') { |file| file.write(html) }
    end

    def delete_page(path)
      full_path = File.join(DOCUMENT_ROOT, path)
      File.delete(full_path)
    rescue Errno::ENOENT
    end
  end
end
