task default: [:ensure_url, :cucumber]

task :ensure_url do
  if ENV['URL']
    puts "Testing against '#{ENV['URL']}'"
    next
  end
  puts "Please enter the URL to test:"
  ENV['URL'] = gets
end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new
