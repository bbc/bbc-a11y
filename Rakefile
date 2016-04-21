require 'bundler'
Bundler::GemHelper.install_tasks

task default: [:unit, :acceptance]

task :unit do
  sh "bundle exec rspec && karma start --single-run"
end

task :acceptance do
  sh "bundle exec cucumber"
end
