require 'spec_helper'

describe Disqussion::Reports do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.reports
      end
      
      describe ".domains" do
        before do
          stub_get("reports/domains.json", :query => { }).
            to_return(:body => fixture("reports/domains.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns report on domains." do
          @client.domains
          a_get("reports/domains.json", :query => { }).
            should have_been_made
        end
      end
      
      describe ".ips" do
        before do
          stub_get("reports/ips.json", :query => { }).
            to_return(:body => fixture("reports/ips.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns report on ips." do
          @client.ips
          a_get("reports/ips.json", :query => { }).
            should have_been_made
        end
      end
      
      describe ".threads" do
        before do
          stub_get("reports/threads.json", :query => { }).
            to_return(:body => fixture("reports/threads.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns report on threads." do
          @client.threads
          a_get("reports/threads.json", :query => { }).
            should have_been_made
        end
      end
      
      describe ".users" do
        before do
          stub_get("reports/users.json", :query => { }).
            to_return(:body => fixture("reports/users.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "returns report on users." do
          @client.users
          a_get("reports/users.json", :query => { }).
            should have_been_made
        end
      end
    end
  end
end