module Disqussion
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options={}, raw=false)
      request(:get, path, options, raw)
    end

    # Perform an HTTP POST request
    def post(path, options={}, raw=false)
      request(:post, path, options, raw)
    end

    private

    # Perform an HTTP request
    def request(method, path, options, raw=false)
      # identify our request
      # @see: http://docs.disqus.com/help/52/
      options ||= {}
      options.merge!(:api_secret => self.api_secret) unless options.has_key?(:api_secret)
      response = connection(raw).send(method) do |request|
        case method
        when :get
          request.url(formatted_path(path), options)
        when :post
          request.path = formatted_path(path)
          request.body = options unless options.empty?
        end
      end
      raw ? response : response.body
    end

    def formatted_path(path)
      [path, format].compact.join('.')
    end
  end
end