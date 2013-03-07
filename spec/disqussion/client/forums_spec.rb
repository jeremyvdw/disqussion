require 'spec_helper'

describe Disqussion::Forums do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.forums
      end

      describe ".addModerator" do
        before do
          stub_post("forums/addModerator.json", :body => { :user => "boom", :forum => "the88"}).
            to_return(:body => fixture("forums/addModerator.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end

        xit "adds a moderator to a forum" do
          @client.addModerator("boom", "the88")
          a_post("forums/addModerator.json", :body => { :user => "boom", :forum => "the88"}).
            should have_been_made
          end
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

      describe ".listModerators" do
        before do 
          stub_get("forums/listModerators.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("forums/listModerators.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end

        it "returns a list of moderators of the forum" do
          @client.listModerators("the88")
          a_get("forums/listModerators.json", :query => { :forum => "the88" }).
            should have_been_made
        end
      end

      describe ".listMostActiveUsers" do 
        before do
          stub_get("forums/listMostActiveUsers.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("forums/listMostActiveUsers.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end

        it "returns a list of the most active users on a forum" do
          @client.listMostActiveUsers("the88")
          a_get("forums/listMostActiveUsers.json", :query => { :forum => "the88" }).
            should have_been_made
        end
      end
      
      describe ".listMostLikedUsers" do
        before do
          stub_get("forums/listMostLikedUsers.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("forums/listMostLikedUsers.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns details on the requested list of users." do
          @client.listMostLikedUsers("the88")
          a_get("forums/listMostLikedUsers.json", :query => { :forum => "the88" }).
            should have_been_made
        end
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
