# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'communique/version'

Gem::Specification.new do |spec|
  spec.name          = "communique"
  spec.version       = Communique::VERSION
  spec.authors       = ["Michael Polycarpou"]
  spec.email         = ["michaelpolycarpou@gmail.com"]
  spec.summary       = %q{
    Simple way to store warnings and errors affecting users as messages. Stored
    messages can be linked to a helpful link so they can read more about the problem
  }
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "mongoid", "~> 4.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'database_cleaner'
end
