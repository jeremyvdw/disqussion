module Disqussion
  class Imports < Client
    # 
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param group [Integer] group ID
    # @return [Hashie::Rash] Details on the requested import.
    # @example 
    #   Disqussion::Client.imports.details(987)
    # @see: http://disqus.com/api/3.0/imports/details.json
    def details(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:group] = args.first
      response = get('imports/details', options)
    end
    
    # Returns list of previous imports.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param forum [String] Allows multiple. Looks up a forum by ID (aka short name).
    # @return [Hashie::Rash] Details on the requested category.
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :cursor. Defaults to null.
    # @example 
    #   Disqussion::Client.imports.list("the88")
    # @see: http://disqus.com/api/3.0/imports/list.json
    def list(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:forum] = args.first
      response = get('imports/list', options)
    end
  end
end