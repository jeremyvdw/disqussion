module Disqussion
  class Reactions < Client
    # Returns ??
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :page. Defaults to 0.  Maximum length of 10
    # @option options [Array, String] :forum allow multiple. Defaults to null. Defaults to all forums you moderate if no other filters are specified. Looks up a forum by ID (aka short name)
    # @return [Hashie::Rash] Returns ??
    # @example Return ??
    #   Disqussion::Client.reactions.domains
    # @see: http://disqus.com/api/3.0/posts/domains.json
    def domains(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('reactions/domains', options)
    end
    
    # Returns ??
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :page. Defaults to 0.  Maximum length of 10
    # @option options [Array, String] :forum allow multiple. Defaults to null. Defaults to all forums you moderate if no other filters are specified. Looks up a forum by ID (aka short name)
    # @return [Hashie::Rash] Returns ??
    # @example Return ??
    #   Disqussion::Client.reactions.ips
    # @see: http://disqus.com/api/3.0/posts/ips.json
    def ips(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('reactions/ips', options)
    end
    
    # Returns ??
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :page. Defaults to 0.  Maximum length of 10
    # @option options [Array, String] :forum allow multiple. Defaults to null. Defaults to all forums you moderate if no other filters are specified. Looks up a forum by ID (aka short name)
    # @return [Hashie::Rash] Returns ??
    # @example Return ??
    #   Disqussion::Client.reactions.threads
    # @see: http://disqus.com/api/3.0/posts/threads.json
    def threads(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('reactions/threads', options)
    end
    
    # Returns ??
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :page. Defaults to 0.  Maximum length of 10
    # @option options [Array, String] :forum allow multiple. Defaults to null. Defaults to all forums you moderate if no other filters are specified. Looks up a forum by ID (aka short name)
    # @return [Hashie::Rash] Returns ??
    # @example Return ??
    #   Disqussion::Client.reactions.users
    # @see: http://disqus.com/api/3.0/posts/users.json
    def users(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('reactions/users', options)
    end
  end
end