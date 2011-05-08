require 'helper'

describe Disqussion::Trends do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.trends
      end
      
      describe ".listTreads" do
        before do
          stub_get("trends/listTreads.json", :query => { }).
            to_return(:body => fixture("trends/listTreads.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns the list of trending threads." do
          @client.listTreads
          a_get("trends/listTreads.json", :query => { }).
            should have_been_made
        end
      end
    end
  end
end