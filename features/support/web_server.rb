require 'net/http'
class WebServer
  attr_reader :port
  RACKUP_CONFIG_FILE = __FILE__.gsub(/rb$/, "ru")

  def initialize(port = find_available_port)
    @port = port
    @pid = nil
  end

  def start
    @pid = fork { `rackup -p #{port} -q #{RACKUP_CONFIG_FILE}` }
    @pid = @pid + 1 # because rackup starts a child process
    puts "waiting until responsive..."
    sleep(0.1) until responsive?
    puts "done"
    self
  end

  def stop
    return unless @pid
    Process.kill("SIGKILL", @pid)
    Process.wait(@pid)
  rescue Errno::ECHILD
  ensure
    self
  end

  private

  def find_available_port
    server = TCPServer.new('127.0.0.1', 0)
    server.addr[1]
  ensure
    server.close if server
  end

  def responsive?
    ::Net::HTTP.start('localhost', port) { |http| http.get("/perfect.html") }.is_a?(Net::HTTPSuccess)
  rescue SystemCallError
    false
  end
end
