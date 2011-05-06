require 'helper'

describe Disqussion::Users do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.users
      end
      
      describe ".details" do
        it "get the correct resource" do
          stub_get("users/details.json").
            to_return(:body => fixture("users/details.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          
          @client.details
          
          a_get("users/details.json").should have_been_made
        end
      end
      
      describe ".follow" do
        it "get the correct resource" do
          stub_post("users/follow.json", :body => { :target => "12345678" }).
            to_return(:body => fixture("users/follow.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          
          @client.follow(12345678)
          
          a_post("users/follow.json", :body => { :target => "12345678"}).should have_been_made
        end
      end
    end
  end
end