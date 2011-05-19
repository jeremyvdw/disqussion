require 'helper'

describe Disqussion::Categories do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.categories
      end
      
      describe ".creates" do
        before do
          stub_post("categories/create.json", :body => { :forum => "the88", :title => "My category" }).
            to_return(:body => fixture("categories/create.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns new category infos." do
          @client.create("the88", "My category")
          a_post("categories/create.json", :body => { :forum => "the88", :title => "My category" }).
            should have_been_made
        end
      end
      
      describe ".details" do
        before do
          stub_get("categories/details.json", :query => { :category => "827231" }).
            to_return(:body => fixture("categories/details.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns details on the requested forum." do
          @client.details(827231)
          a_get("categories/details.json", :query => { :category => "827231" }).
            should have_been_made
        end
      end
      
      describe ".list" do
        before do
          stub_get("categories/list.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("categories/list.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns a list of categories within a forum." do
          @client.list(:forum => "the88")
          a_get("categories/list.json", :query => { :forum => "the88" }).
            should have_been_made
        end
      end
      
      describe ".listPosts" do
        before do
          stub_get("categories/listPosts.json", :query => { :category => "827231" }).
            to_return(:body => fixture("categories/listPosts.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns a list of posts within a category." do
          @client.listPosts(827231)
          a_get("categories/listPosts.json", :query => { :category => "827231" }).
            should have_been_made
        end
      end
      
      describe ".listThreads" do
        before do
          stub_get("categories/listThreads.json", :query => { :category => "827231" }).
            to_return(:body => fixture("categories/listThreads.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns a list of threads within a category sorted by the date created." do
          @client.listThreads(827231)
          a_get("categories/listThreads.json", :query => { :category => "827231" }).
            should have_been_made
        end
      end
    end
  end
end