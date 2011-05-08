module Disqussion
  class Trends < Client
    # Returns a list of trending threads.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp, rss
    # @authenticated: false
    # @limited: false
    # @param forum [String] Forum ID (aka short name).
    # @return [Hashie::Rash] Returns list of trending threads.
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [String, Array] :related allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, author, category
    # @option options [Array, String] :forum allows multiple. Defaults to null. Looks up a forum by ID (aka short name)
    # @example Returns a list of trending threads
    #   Disqussion::Client.trends.listTreads()
    # @see: http://disqus.com/api/3.0/trends/listTreads.json
    def listTreads(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('trends/listTreads', options)
    end
  end
end