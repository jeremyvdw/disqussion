require 'spec_helper'

describe Disqussion::Reactions do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.reactions
      end

      describe ".details" do
        before do
          stub_get("reactions/details.json", :query => { }).
            to_return(:body => fixture("reactions/details.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end

        xit "returns reaction details" do
          @client.details()
          a_get("reactions/details.json", :query => { }).
            should have_been_made
        end
      end
      
      describe ".domains" do
        before do
          stub_get("reactions/domains.json", :query => { }).
            to_return(:body => fixture("reactions/domains.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns ???" do
          @client.domains
          a_get("reactions/domains.json", :query => { }).
            should have_been_made
        end
      end
      
      describe ".ips" do
        before do
          stub_get("reactions/ips.json", :query => { }).
            to_return(:body => fixture("reactions/ips.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns ???" do
          @client.ips
          a_get("reactions/ips.json", :query => { }).
            should have_been_made
        end
      end

      describe ".list" do
        before do
          stub_get("reactions/list.json", :query => {:forum => "the88"}).
            to_return(:body => fixture("reactions/list.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end

        it "returns a list of reactions for a forum" do
          @client.list("the88")
          a_get("reactions/list.json", :query => {:forum => "the88" }).
            should have_been_made
        end
      end
      
      describe ".threads" do
        before do
          stub_get("reactions/threads.json", :query => { }).
            to_return(:body => fixture("reactions/threads.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns ???" do
          @client.threads
          a_get("reactions/threads.json", :query => { }).
            should have_been_made
        end
      end
      
      describe ".users" do
        before do
          stub_get("reactions/users.json", :query => { }).
            to_return(:body => fixture("reactions/users.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns ???" do
          @client.users
          a_get("reactions/users.json", :query => { }).
            should have_been_made
        end
      end
    end
  end
end