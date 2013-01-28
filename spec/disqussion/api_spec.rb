require 'spec_helper'

describe Disqussion::API do
  before do
    @keys = Disqussion::Configuration::VALID_OPTIONS_KEYS
  end

  context "with module configuration" do
    before do
      Disqussion.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      Disqussion.reset
    end

    it "should inherit module configuration" do
      api = Disqussion::API.new
      @keys.each do |key|
        api.send(key).should == key
      end
    end

    context "with class configuration" do
      before do
        @configuration = {
          :api_key => 'key',
          :api_secret => 'secret',
          :adapter => :typhoeus,
          :endpoint => 'http://disqus.com/api',
          :format => :json,
          :proxy => 'http://the88:bar@proxy.example.com:8080',
          :user_agent => 'Custom User Agent',
        }
      end

      context "during initialization" do
        it "should override module configuration" do
          api = Disqussion::API.new(@configuration)
          @keys.each do |key|
            api.send(key).should == @configuration[key] if @configuration[key]
          end
        end
      end

      context "after initilization" do
        it "should override module configuration after initialization" do
          api = Disqussion::API.new
          @configuration.each do |key, value|
            api.send("#{key}=", value)
          end
          @keys.each do |key|
            api.send(key).should == @configuration[key] if @configuration[key]
          end
        end
      end
    end
  end
end
