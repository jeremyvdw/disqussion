require 'faraday'

# @private
module Faraday
  # @private
  class Response::RaiseHttp4xx < Response::Middleware
    def on_complete(env)
      case env[:status].to_i
      when 400
        raise Disqussion::BadRequest.new(error_message(env), env[:response_headers])
      when 401
        raise Disqussion::Unauthorized.new(error_message(env), env[:response_headers])
      when 403
        raise Disqussion::Forbidden.new(error_message(env), env[:response_headers])
      when 404
        raise Disqussion::NotFound.new(error_message(env), env[:response_headers])
      end
    end

    private

    def error_message(env)
      "#{env[:method].to_s.upcase} #{env[:url].to_s}: (#{env[:status]}) #{error_body(env[:body])}"
    end

    def error_body(body)
      if body['code'] && body['response']
        "Disqus Error #{body['code']}: #{body['response']}"
      else
        nil
      end
    end
  end
end