Given(/^a standards-compliant website running at http:\/\/localhost:(\d+)$/) do |port|
  WebServer.ensure_running_on(port)
end
