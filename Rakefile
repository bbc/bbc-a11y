require 'bundler'
Bundler::GemHelper.install_tasks

task default: [:unit, :acceptance]

task :unit do
  sh "rspec"
end

task :acceptance do
  sh "cd example && rake"
end
