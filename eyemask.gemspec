# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eyemask/version'

Gem::Specification.new do |spec|
  spec.name          = "eyemask"
  spec.version       = Eyemask::VERSION
  spec.authors       = ["Joe Geldart"]
  spec.email         = ["joe.geldart@wearefriday.com"]

  spec.summary       = %q{Eyemask makes it easy to create rich, engaging, living documentation that everyone can use.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "cucumber", "~> 1.1.1"
  spec.add_development_dependency "aruba", "~> 0.6.2"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_runtime_dependency "multi_json", "~> 1.11.0"
  spec.add_runtime_dependency "thor", "~> 0.19.1"
  spec.add_runtime_dependency "redcarpet", "~> 3.2.2"
  spec.add_runtime_dependency "liquid", "~> 3.0.1"
  spec.add_runtime_dependency "rouge"
end
