require 'spec_helper'

describe Disqussion::Client do
  context ".new" do
    before do
      @client = Disqussion::Client.new
    end
  
    it "connect using the endpoint configuration" do
      connection = @client.send(:connection).build_url(nil).to_s
      connection.should == @client.api_endpoint.gsub(/\/$/, '')
    end
  end
end
