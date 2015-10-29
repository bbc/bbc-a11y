# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'bbc-a11y'
  s.version     = File.read(File.expand_path("../lib/bbc/a11y/version", __FILE__))
  s.authors     = ["Matt Wynne", "Ian Pouncey"]
  s.description = "A tool for testing the compliance of web URLs against the BBC's accessibilty guidelines"
  s.summary     = "bbc-a11y-#{s.version}"
  s.email       = "github@ipouncey.co.uk"
  s.homepage    = "https://cucumber.pro"
  s.platform    = Gem::Platform::RUBY
  s.license     = "MIT"
  s.required_ruby_version = ">= 1.9.3"

  s.add_dependency 'capybara'
  s.add_dependency 'colorize'

  s.add_development_dependency 'rspec',  '~> 3.0'
  s.add_development_dependency 'aruba'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'cucumber'

  s.rubygems_version = ">= 1.6.1"
  s.files            = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/ }
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end
