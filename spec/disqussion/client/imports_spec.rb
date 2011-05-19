require 'helper'

describe Disqussion::Imports do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.imports
      end
      
      describe ".details" do
        before do
          stub_get("imports/details.json", :query => { :group => "987" }).
            to_return(:body => fixture("imports/details.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns ." do
          @client.details(987)
          a_get("imports/details.json", :query => { :group => "987" }).
            should have_been_made
        end
      end
      
      describe ".list" do
        before do
          stub_get("imports/list.json", :query => { :forum => "the88" }).
            to_return(:body => fixture("imports/list.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns ." do
          @client.list("the88")
          a_get("imports/list.json", :query => { :forum => "the88" }).
            should have_been_made
        end
      end
    end
  end
end