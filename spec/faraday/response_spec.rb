require 'helper'

describe Faraday::Response do
  before do
    @client = Disqussion::Client.users
  end

  {
    400 => Disqussion::BadRequest,
    401 => Disqussion::Unauthorized,
    403 => Disqussion::Forbidden,
    404 => Disqussion::NotFound,
    500 => Disqussion::InternalServerError,
  }.each do |status, exception|
    context "when HTTP status is #{status}" do

      before do
        stub_get('users/details.json').
          to_return(:status => status, :body => fixture("faraday/error2.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end

      it "should raise #{exception.name} error" do
        lambda do
          @client.details
        end.should raise_error(exception)
      end
    end
  end
end