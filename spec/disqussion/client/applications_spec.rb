require 'spec_helper'

describe Disqussion::Applications do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.applications
      end
    
      context "listUsage" do
        before do
          stub_get("applications/listUsage.json").
            to_return(:body => fixture("applications/listUsage.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
      
        it "returns the API usage per day for this application." do
          @client.listUsage
          a_get("applications/listUsage.json").should have_been_made
        end
      end

    end
  end
end