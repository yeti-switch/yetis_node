# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yetis_node/version'

Gem::Specification.new do |spec|
  spec.name          = "yetis_node"
  spec.version       = YetisNode::VERSION
  spec.authors       = ["Igor Fedoronchuk"]
  spec.email         = ["igor.f@didww.com"]
  spec.summary       = %q{XMLRPC client for YETI switch.}
  spec.description   = %q{XMLRPC client for YETI switch. http://yeti-switch.org  }
  spec.homepage      = "http://yeti-switch.org"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
