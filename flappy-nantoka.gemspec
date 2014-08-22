# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flappy-nantoka/version'

Gem::Specification.new do |spec|
  spec.name          = "flappy-nantoka"
  spec.version       = FlappyNantoka::VERSION
  spec.authors       = ["Masafumi Yokoyama"]
  spec.email         = ["myokoym@gmail.com"]
  spec.summary       = %q{A simple action game by Yeah.}
  spec.description   = spec.summary
  spec.homepage      = "http://github.com/myokoym/flappy-nantoka"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("opal", "~> 0.6")
  spec.add_runtime_dependency("yeah", "~> 0.3.3")

  spec.add_development_dependency("bundler")
  spec.add_development_dependency("rake")
end
