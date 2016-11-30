$:.push File.expand_path("../lib", __FILE__)
require 'enhanced_logger/version'


Gem::Specification.new do |s|
  s.name        = 'enhanced-logger'
  s.version     = EnhancedLogger::VERSION
  s.date        = Time.now.strftime( "%Y-%m-%d" )
  s.summary     = "Enhanced Logger"
  s.description = "Logs extra info."
  s.authors     = ["George Ulmer"]
  s.email       = 'george@boost-media.com'
  s.files       = Dir['lib/**/*']
  s.homepage    = 'https://github.com/iAmPlus/enhanced-logger'
  s.license     = 'MIT'
  s.add_development_dependency 'rspec', '3.5.0'
  s.add_development_dependency 'rack', '2.0.1'
  s.add_development_dependency 'rack-test', '0.6.3'
end
