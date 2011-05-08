require 'helper'

describe Disqussion::Posts do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.posts
      end
      
      describe ".approve" do
        before do
          stub_post("posts/approve.json", :body => { :post => "199088808" }).
            to_return(:body => fixture("posts/approve.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "approves a post." do
          @client.approve(199088808)
          a_post("posts/approve.json", :body => { :post => "199088808" }).
            should have_been_made
        end
      end
      
      describe ".create" do
        before do
          stub_post("posts/create.json", :body => { :message => "Nice post!" }).
            to_return(:body => fixture("posts/create.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "create a post." do
          @client.create("Nice post!")
          a_post("posts/create.json", :body => { :message => "Nice post!" }).
            should have_been_made
        end
      end
      
      describe ".details" do
        before do
          stub_get("posts/details.json", :query => { :post => "199088808" }).
            to_return(:body => fixture("posts/details.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns details on the requested post." do
          @client.details(199088808)
          a_get("posts/details.json", :query => { :post => "199088808" }).
            should have_been_made
        end
      end
      
      describe ".highlight" do
        before do
          stub_post("posts/highlight.json", :body => { :post => "199088808" }).
            to_return(:body => fixture("posts/highlight.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns id of the highlighted post." do
          @client.highlight(199088808)
          a_post("posts/highlight.json", :body => { :post => "199088808" }).
            should have_been_made
        end
      end
      
      describe ".list" do
        before do
          stub_get("posts/list.json", :query => { :thread => "293757871" }).
            to_return(:body => fixture("posts/list.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns a list of posts for thread '293757871' ordered by the date created." do
          @client.list(:thread => 293757871)
          a_get("posts/list.json", :query => { :thread => "293757871" }).
            should have_been_made
        end
      end
    end
  end
end