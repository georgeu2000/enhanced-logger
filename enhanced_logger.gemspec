$:.push File.expand_path("../lib", __FILE__)
require 'enhanced_logger/version'

Gem::Specification.new do |s|
  s.name        = 'enhanced-logger'
  s.version     = EnhancedLogger::VERSION
  s.date        = '2016-01-28'
  s.summary     = "Enhanced Logger"
  s.description = "Logs extra info."
  s.authors     = ["George Ulmer"]
  s.email       = 'george@boost-media.com'
  s.files       = Dir['lib/**/*']
  s.homepage    = 'http://rubygems.org/gems/enhanced_logger'
  s.license     = 'MIT'
end