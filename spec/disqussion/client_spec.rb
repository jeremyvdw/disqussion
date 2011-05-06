require 'helper'

describe Disqussion::Client do
  context ".new" do
    before do
      @client = Disqussion::Client.new
    end
  
    it "connect using the endpoint configuration" do
      endpoint = URI.parse(@client.api_endpoint)
      connection = @client.send(:connection).build_url(nil).to_s
      connection.should == endpoint.to_s
    end
  end
end