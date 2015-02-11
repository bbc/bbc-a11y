class Server
  attr_reader :port

  def initialize
    @pid = nil
    @port = find_available_port
  end

  def start
    @pid = fork { `rackup -p #{port}` }
    @pid = @pid + 1 # because rackup starts a child process
    sleep(0.1) until responsive?
  end

  def stop
    return unless @pid
    Process.kill("SIGKILL", @pid)
    Process.wait(@pid)
  rescue Errno::ECHILD
  end

  private

  def find_available_port
    server = TCPServer.new('127.0.0.1', 0)
    server.addr[1]
  ensure
    server.close if server
  end

  def responsive?
    Net::HTTP.start('localhost', port) { |http| http.get("/perfect.html") }.is_a?(Net::HTTPSuccess)
  rescue SystemCallError
    false
  end
end

BBC::A11y.configure do
  server = Server.new

  before_all do
    server.start
  end

  after_all do
    server.stop
  end

  page "http://localhost:#{server.port}/perfect.html"
end
