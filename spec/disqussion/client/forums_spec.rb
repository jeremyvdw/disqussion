require 'helper'

describe Disqussion::Forums do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.forums
      end
    
      describe ".create" do
      end
    
      describe ".details" do
      end
    
      describe ".list_categories" do
      end
    
    end
  end
end