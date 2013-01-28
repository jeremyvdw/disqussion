# -*- encoding: utf-8 -*-
require File.expand_path('../lib/disqussion/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "disqussion"
  s.version     = Disqussion::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jérémy Van de Wyngaert"]
  s.email       = ['jeremyvdw@gmail.com']
  s.homepage    = 'https://github.com/jeremyvdw/disqussion'
  s.summary     = %q{Disqus API v3 wrapper}
  s.description = %q{Disqus API v3 wrapper}

  s.rubyforge_project = "disqussion"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('json', '~> 1.7')
  s.add_development_dependency('nokogiri', '~> 1.5')
  s.add_development_dependency('maruku', '~> 0.6')
  s.add_development_dependency('rake', '>= 10.0')
  s.add_development_dependency('rspec', '>= 2.11')
  s.add_development_dependency('simplecov', '~> 0.7')
  s.add_development_dependency('webmock', '~> 1.9')
  s.add_development_dependency('yard', '~> 0.8')
  
  s.add_runtime_dependency('hashie', '~> 1.2')
  s.add_runtime_dependency('faraday', '~> 0.8')
  s.add_runtime_dependency('faraday_middleware', '>= 0.9')
  s.add_runtime_dependency('multi_json', '~> 1.5')
  s.add_runtime_dependency('rash', '~> 0.3')
end
