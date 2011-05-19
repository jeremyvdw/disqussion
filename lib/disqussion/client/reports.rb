module Disqussion
  class Reports < Client
    # Returns report on domains
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100.
    # @option options [Integer] :page. Defaults to 0. Maximum length of 10.
    # @option options [Array, String] :forum. Allow multiple. Defaults to null. Looks up a forum by ID (aka short name).
    # @return [Hashie::Rash] Returns report
    # @example Return report on comments by domains usage
    #   Disqussion::Client.reports.domains
    # @see: http://disqus.com/api/3.0/reports/domains.json
    def domains(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('reports/domains', options)
    end
    
    # Returns report on ips
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100.
    # @option options [Integer] :page. Defaults to 0. Maximum length of 10.
    # @option options [Array, String] :forum. Allow multiple. Defaults to null. Looks up a forum by ID (aka short name).
    # @return [Hashie::Rash] Returns report
    # @example Return report on comments by IPs usage
    #   Disqussion::Client.reports.ips
    # @see: http://disqus.com/api/3.0/reports/ips.json
    def ips(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('reports/ips', options)
    end
    
    # Returns report on threads
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100.
    # @option options [Integer] :page. Defaults to 0. Maximum length of 10.
    # @option options [Array, String] :forum. Allow multiple. Defaults to null. Looks up a forum by ID (aka short name).
    # @return [Hashie::Rash] Returns report
    # @example Return report on comments by threads
    #   Disqussion::Client.reports.threads
    # @see: http://disqus.com/api/3.0/reports/threads.json
    def threads(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('reports/threads', options)
    end
    
    # Returns report on users
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100.
    # @option options [Integer] :page. Defaults to 0. Maximum length of 10.
    # @option options [Array, String] :forum. Allow multiple. Defaults to null. Looks up a forum by ID (aka short name).
    # @return [Hashie::Rash] Returns report
    # @example Return report on comments by users
    #   Disqussion::Client.reports.users
    # @see: http://disqus.com/api/3.0/reports/users.json
    def users(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('reports/users', options)
    end
  end
end