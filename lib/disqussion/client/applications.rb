module Disqussion
  class Applications < Client
    # Returns the API usage per day for this application.
    # 
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @return [Hashie::Rash] API usage per day for this application.
    # @param application [Integer] Defaults to null
    # @param days [Integer] Defaults to 30, Maximum length of 30
    # @see http://disqus.com/api/3.0/applications/listUsage.json
    def listUsage(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      get('applications/listUsage', options)
    end
  end
end
