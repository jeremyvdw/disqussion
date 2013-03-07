module Disqussion
  class Reactions < Client

    # Returns reaction details
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param reaction [Integer] Looks up a reaction by ID.    
    # @param forum [String] Looks up a forum by ID (aka shortname). 
    # @return [Hashie::Rash] Reaction of the forum.
    # @example Message for post ID 12345678
    #   Disqussion::Client.reactions.detail(12345678,"Hello")
    # @see: http://disqus.com/api/3.0/reactions/details.json
    def details(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      if args.length == 2
        options.merge!(:reaction => args[0])
        options.merge!(:forum => args[1])
        response = get('reactions/details', options)
      else
        puts "#{Kernel.caller.first}: Reactions.details expects 2 arguments: reaction and forum"
      end
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

    # Returns a list of reactions 
    # @accessibility: public key, secret key
    # @methods: POST,GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param forum [String] Looks up a forum by ID (aka shortname).
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :related. Defaults to []
    # @option options [String] :order. Defaults to "asc". Choices: asc, desc
    # @return [Hashie::Rash] Reaction of the forum.
    # @example Message for post ID 12345678
    #   Disqussion::Client.reactions.detail(12345678,"Hello")
    # @see: http://disqus.com/api/3.0/reactions/details.json
    def list(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:forum] = args.first
      response = get('reactions/list', options)
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