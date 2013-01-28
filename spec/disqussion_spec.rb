require 'spec_helper'

describe Disqussion do
  after do
    Disqussion.reset
  end

  context "when delegating to a client" do
    # before do
    #   stub_get("users/details.json").
    #     with(:query => {:"user:username" => "the88"}).
    #     to_return(:body => fixture("statuses.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    # end
    # 
    # it "should get the correct resource" do
    #   Disqussion.user_timeline('the88')
    #   a_get("users/details.json").
    #     with(:query => {:"user:username" => "the88"}).
    #     should have_been_made
    # end
    # 
    # it "should return the same results as a client" do
    #   Disqussion.user_timeline('the88').should == Disqussion::Client.new.user_timeline('the88')
    # end
  end

  describe '.respond_to?' do
    it 'takes an optional include private argument' do
      Disqussion.respond_to?(:client, true).should be_true
    end
  end

  describe ".client" do
    it "should be a Disqussion::Client" do
      Disqussion.client.should be_a Disqussion::Client
    end
  end

  describe ".adapter" do
    it "should return the default adapter" do
      Disqussion.adapter.should == Disqussion::Configuration::DEFAULT_ADAPTER
    end
  end

  describe ".adapter=" do
    it "should set the adapter" do
      Disqussion.adapter = :typhoeus
      Disqussion.adapter.should == :typhoeus
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      Disqussion.endpoint.should == Disqussion::Configuration::DEFAULT_ENDPOINT
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      Disqussion.endpoint = 'http://tumblr.com/'
      Disqussion.endpoint.should == 'http://tumblr.com/'
    end
  end

  describe ".format" do
    it "should return the default format" do
      Disqussion.format.should == Disqussion::Configuration::DEFAULT_FORMAT
    end
  end

  describe ".format=" do
    it "should set the format" do
      Disqussion.format = 'xml'
      Disqussion.format.should == 'xml'
    end
  end

  describe ".user_agent" do
    it "should return the default user agent" do
      Disqussion.user_agent.should == Disqussion::Configuration::DEFAULT_USER_AGENT
    end
  end

  describe ".user_agent=" do
    it "should set the user_agent" do
      Disqussion.user_agent = 'Custom User Agent'
      Disqussion.user_agent.should == 'Custom User Agent'
    end
  end

  describe ".configure" do
    Disqussion::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        Disqussion.configure do |config|
          config.send("#{key}=", key)
          Disqussion.send(key).should == key
        end
      end
    end
  end
end