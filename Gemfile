source 'https://rubygems.org'

gem 'jruby-openssl', :platforms => :jruby
gem 'rake'
gem 'yard'

group :development do
  gem 'pry'
  gem 'pry-debugger', :platforms => :mri_19
end

group :test do
  gem 'json', :platforms => [:ruby_18, :jruby]
  gem 'rspec', '>= 2.11'
  gem 'simplecov'
  gem 'webmock'
end

gemspec
