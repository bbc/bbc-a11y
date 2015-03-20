Given(/^a standards-compliant website running at http:\/\/localhost:(\d+)$/) do |port|
  server = WebServer.new(port.to_i).start
  at_exit { server.stop }
end
