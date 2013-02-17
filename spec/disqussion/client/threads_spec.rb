require 'spec_helper'

describe Disqussion::Threads do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.threads
      end

      describe ".create" do
        before do
          stub_post("threads/create.json", :body => { :forum => "bobross", :title => "Hello World" }).
            to_return(:body => fixture("threads/create.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          end

        it "creates a new thread" do
          @client.create("bobross","Hello World")
          a_post("threads/create.json", :body => { :forum => "bobross", :title => "Hello World" }).
            should have_been_made
        end
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
        before do 
          stub_get("threads/listHot.json", :query => { :forum => "cnn" }).
            to_return(:body => fixture("threads/listHot.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end

        it "returns a list of hot threads of a forum" do
          @client.listHot(:forum => "cnn")
          a_get("threads/listHot.json", :query => { :forum => "cnn" }).
            should have_been_made
        end
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
        before do 
          stub_get("threads/listPopular.json", :query => {:forum => "facebook" }).
            to_return(:body => fixture("threads/listPopular.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          end

          it "returns a list of the most popular posts in a interval" do
            @client.listPopular(:forum => "facebook")
            a_get("threads/listPopular.json", :query => { :forum => "facebook"}).
              should have_been_made
          end
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

      describe ".set" do
        it "get the correct resource" do
          stub_get("threads/set.json", :query => { :thread => "12345678" }).
            to_return(:body => fixture("threads/set.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          
          @client.set(12345678)
          
          a_get("threads/set.json", :query => { :thread => "12345678"}).should have_been_made
        end
      end

      describe ".subscribe" do
        before do 
          stub_post("threads/subscribe.json", :body => { :thread => "12345678" }).
            to_return(:body => fixture("threads/subscribe.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end

        xit "subscribes to thread" do
          @client.subscribe(12345678)
          a_post("threads/subscribe.json", :body => { :thread => "12345678"}).
            should have_been_made
        end
      end

      describe ".update" do
        before do
          stub_post("threads/update.json", :body => { :thread => "1", :title => "Hello World" }).
            to_return(:body => fixture("threads/update.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          end

        it "updates a thread" do
          @client.update(1, "Hello World")
          a_post("threads/update.json", :body => { :thread => "1", :title => "Hello World" }).
            should have_been_made
        end
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