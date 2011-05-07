require 'simplecov'
SimpleCov.start do
  add_group 'Disqussion', 'lib/disqussion'
  add_group 'Specs', 'spec'
end
require 'disqussion'
require 'rspec'
require 'webmock/rspec'
RSpec.configure do |config|
  config.include WebMock::API
  
  config.before(:each) do
    Disqussion.api_secret = 'w00t'
  end
end

def a_get(path, options = {})
  options[:query] ||= {}
  options[:query].merge! :api_secret => Disqussion.api_secret
  a_request(:get, Disqussion.endpoint + path).with(options)
end

def a_post(path, options = {})
  options[:body] ||= {}
  options[:body].merge! :api_secret => Disqussion.api_secret
  a_request(:post, Disqussion.endpoint + path).with(options)
end

def stub_get(path, options = {})
  options[:query] ||= {}
  options[:query].merge! :api_secret => Disqussion.api_secret
  stub_request(:get, Disqussion.endpoint + path).with(options)
end

def stub_post(path, options = {})
  options[:body] ||= {}
  options[:body].merge! :api_secret => Disqussion.api_secret
  stub_request(:post, Disqussion.endpoint + path).with(options)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end