require 'bundler'
Bundler::GemHelper.install_tasks

task default: [:unit, :acceptance]

task :unit do
  sh "bundle exec rspec"
end

task :acceptance do
  sh "bundle exec cucumber"
end
