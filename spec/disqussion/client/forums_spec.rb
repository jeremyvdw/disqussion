require 'helper'

describe Disqussion::Forums do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.forums
      end
      
      describe ".create" do
        before do
          stub_get("forums/create.json", :query => { :website => "the88", :name => "My Forum", :short_name => "myforum" }).
            to_return(:body => fixture("forums/create.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns new forum infos." do
          @client.create("the88", "My Forum", "myforum")
          a_get("forums/create.json", :query => { :website => "the88", :name => "My Forum", :short_name => "myforum" }).
            should have_been_made
        end
      end
      
      describe ".details" do
        before do
          stub_get("forums/details.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("forums/details.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns details on the requested forum." do
          @client.details("the88")
          a_get("forums/details.json", :query => { :forum => "the88" }).
            should have_been_made
        end
      end
      
      describe ".listMostLikedUsers" do
        pending
      end
      
      describe ".listCategories" do
        before do
          stub_get("forums/listCategories.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("forums/listCategories.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns details on the requested list of categories." do
          @client.listCategories("the88")
          a_get("forums/listCategories.json", :query => { :forum => "the88" }).
            should have_been_made
        end
      end
      
      describe ".listPosts" do
        before do
          stub_get("forums/listPosts.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("forums/listPosts.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns details on the requested list of posts." do
          @client.listPosts("the88")
          a_get("forums/listPosts.json", :query => { :forum => "the88" }).
            should have_been_made
        end
      end
      
      describe ".listThreads" do
        before do
          stub_get("forums/listThreads.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("forums/listThreads.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns details on the requested list of threads." do
          @client.listThreads("the88")
          a_get("forums/listThreads.json", :query => { :forum => "the88" }).
            should have_been_made
        end
      end
      
      describe ".listUsers" do
        before do
          stub_get("forums/listUsers.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("forums/listUsers.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns details on the requested list of users." do
          @client.listUsers("the88")
          a_get("forums/listUsers.json", :query => { :forum => "the88" }).
            should have_been_made
        end
      end
    end
  end
end