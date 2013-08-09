# -*- encoding: utf-8 -*-
require File.expand_path('../lib/disqussion/version', __FILE__)

Gem::Specification.new do |spec|
  spec.add_dependency('hashie', '~> 2.0')
  spec.add_dependency('faraday', '~> 0.8')
  spec.add_dependency('faraday_middleware', '>= 0.9')
  spec.add_dependency('multi_json', '~> 1.5')
  spec.add_dependency('rash', '~> 0.3')
  spec.authors        = ["Jérémy Van de Wyngaert"]
  spec.description    = %q{Disqus API v3 wrapper}
  spec.email          = ['jeremyvdw@gmail.com']
  spec.files          = `git ls-files`.split("\n")
  spec.homepage       = 'https://github.com/jeremyvdw/disqussion'
  spec.licenses       = ['MIT']
  spec.name           = 'disqussion'
  spec.require_paths  = ["lib"]
  spec.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  spec.summary        = spec.description
  spec.test_files     = Dir.glob("spec/**/*")
  spec.version        = Disqussion::VERSION.dup
end
