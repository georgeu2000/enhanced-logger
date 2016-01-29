lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enhanced_logger/version'

Gem::Specification.new do |s|
  s.name        = 'enhanced-logger'
  s.version     = '0.0.8'
  s.date        = '2016-01-28'
  s.summary     = "Enhanced Logger"
  s.description = "Logs extra info."
  s.authors     = ["George Ulmer"]
  s.email       = 'george@boost-media.com'
  s.files       = `git ls-files`.split($/)
  s.homepage    = 'http://rubygems.org/gems/enhanced_logger'
  s.license     = 'MIT'
end