require 'spec_helper'

describe Disqussion::Exports do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.exports
      end
      
      describe ".create" do
        before do
          stub_post("exports/exportForum.json", :body => { :forum => "the88" }).
            to_return(:body => fixture("exports/exportForum.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end
        
        it "exports a forum." do
          @client.exportForum("the88")
          a_post("exports/exportForum.json", :body => { :forum => "the88" }).
            should have_been_made
        end
      end
    end
  end
end