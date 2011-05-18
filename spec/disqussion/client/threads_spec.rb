require 'helper'

describe Disqussion::Threads do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.threads
      end
      
      describe ".close" do
        before do
          stub_post("threads/close.json", :body => { :thread => "mythread" }).
            to_return(:body => fixture("threads/close.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns code 0 response." do
          @client.close("mythread")
          a_post("threads/close.json", :body => { :thread => "mythread" }).
            should have_been_made
        end
      end
      
      describe ".details" do
        before do
          stub_get("threads/details.json", :query => { :thread => "mythread" }).
            to_return(:body => fixture("threads/details.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns thread details." do
          @client.details("mythread")
          a_get("threads/details.json", :query => { :thread => "mythread" }).
            should have_been_made
        end
      end
      
      describe ".list" do
        before do
          stub_get("threads/list.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("threads/list.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns a list of threads sorted by the date created." do
          @client.list(:forum => "the88")
          a_get("threads/list.json", :query => { :forum => "the88" }).
            should have_been_made
        end
      end
      
      describe ".listBydate" do
        pending
      end
      
      describe ".listHot" do
        pending
      end
      
      describe ".listMostLiked" do
        before do
          stub_get("threads/listMostLiked.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("threads/listMostLiked.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns a list of threads sorted by number of likes." do
          @client.listMostLiked(:forum => "the88")
          a_get("threads/listMostLiked.json", :query => { :forum => "the88" }).
            should have_been_made
        end
      end
      
      describe ".listPopular" do
        pending
      end
      
      describe ".listPosts" do
        before do
          stub_get("threads/listPosts.json", :query => { :thread => "mythread" }).
            to_return(:body => fixture("threads/listPosts.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns a list of threads sorted by number of likes." do
          @client.listPosts("mythread")
          a_get("threads/listPosts.json", :query => { :thread => "mythread" }).
            should have_been_made
        end
      end
      
      describe ".listSimilar" do
        pending
      end
      
      describe ".open" do
        before do
          stub_post("threads/open.json", :body => { :thread => "12345678" }).
            to_return(:body => fixture("threads/open.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns code 0 response." do
          @client.open(12345678)
          a_post("threads/open.json", :body => { :thread => "12345678" }).
            should have_been_made
        end
      end
      
      describe ".remove" do
        before do
          stub_post("threads/remove.json", :body => { :thread => "12345678" }).
            to_return(:body => fixture("threads/remove.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns code 0 response." do
          @client.remove(12345678)
          a_post("threads/remove.json", :body => { :thread => "12345678" }).
            should have_been_made
        end
      end
      
      describe ".restore" do
        before do
          stub_post("threads/restore.json", :body => { :thread => "12345678" }).
            to_return(:body => fixture("threads/restore.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns code 0 response." do
          @client.restore(12345678)
          a_post("threads/restore.json", :body => { :thread => "12345678" }).
            should have_been_made
        end
      end
      
      describe ".update" do
        pending
      end
      
      describe ".vote" do
        before do
          stub_post("threads/vote.json", :body => { :vote => "1", :thread => "12345678" }).
            to_return(:body => fixture("threads/vote.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns code 0 response." do
          @client.vote(1, 12345678)
          a_post("threads/vote.json", :body => { :vote => "1", :thread => "12345678" }).
            should have_been_made
        end
      end
    end
  end
end