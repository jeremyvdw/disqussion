module Disqussion
  class Forums < Client
    # NOTE: to be implemented when debugged
    # Creates a new forum.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param website [String] Disqus website name.
    # @param name [String] Forum name.
    # @param short_name [String] Forum short name (aka forum id).
    # @return {CURRENTLY BUGGED}
    # @example Creates a new forum 'myforum'
    #   Disqus.create("myforum")
    # @see: http://disqus.com/api/3.0/forums/create.json
    def create(website, name, short_name)
      response = get('forums/create', website, name, short_name)
    end
    
    # Returns forum details.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param forum [String] Forum ID (aka short name).
    # @return [Hashie::Rash] Details on the requested forum.
    # @example Return extended information for forum 'myforum'
    #   Disqus.details("myforum")
    # @see: http://disqus.com/api/3.0/forums/details.json
    def details(forum)
      response = get('forums/details', forum)
    end
    
    # Returns a list of categories within a forum.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param forum [String] Forum ID (aka short name).
    # @return [Hashie::Rash] Details on the requested list of categories.
    # @param options [Hash] A customizable set of options.
    # @option options [Datetime, Timestamp] :since_id. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [String] :order. Defaults to "asc". Choices: asc, desc
    # @example Return extended information for forum 'myforum'
    #   Disqus.listCategories("myforum", {:cursor => 10, :limit => 10, :order => 'asc'})
    # @see: http://disqus.com/api/3.0/forums/details.json
    def listCategories(forum, options = {})
      response = get('forums/listCategories', forum, options)
    end
    
    # NOTE: to be implemented
    # Returns a list of users active within a forum ordered by most likes received.
    # @see: http://disqus.com/api/3.0/forums/listMostLikedUsers.json
    def listMostLikedUsers(forum, options = {})
    end
    
    # Returns a list of posts within a forum.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp, rss
    # @authenticated: false
    # @limited: false
    # @param forum [String] Forum ID (aka short name).
    # @return [Hashie::Rash] Details on the list of posts.
    # @param options [Hash] A customizable set of options.
    # @option options [Datetime, Timestamp] :since_id. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer, String] :related. Allows multiple. Defaults to []. You may specify relations to include with your response. Choices: thread.
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :query. Defaults to null. 
    # @option options [String, Array] :include allows multiple. Defaults to ["approved"]. Choices: unapproved, approved, spam, deleted, flagged
    # @option options [String] :order. Defaults to "asc". Choices: asc, desc
    # @example Return list of (all) posts for forum 'myforum', including related threads
    #   Disqus.listPosts("myforum", {:related => ["thread"], :include => ["spam", "deleted", "flagged"]})
    # @see: http://disqus.com/api/3.0/forums/listPosts.json
    def listPosts(forum, options = {})
      response = get('forums/listPosts', forum, options)
    end
    
    # Returns a list of threads within a forum.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp, rss
    # @authenticated: false
    # @limited: false
    # @param forum [String] Forum ID (aka short name).
    # @return [Hashie::Rash] Details on the list of posts.
    # @param options [Hash] A customizable set of options.
    # @option options [Integer, String, Array] :thread. Allows multiple. Defaults to null. Looks up a thread by ID. You may pass use the 'ident' or 'link' query types instead of an ID by including 'forum'
    # @option options [Datetime, Timestamp] :since_id. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer, String] :related. Allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, author.
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [String, Array] :include allows multiple. Defaults to ["open", "close"]. Choices: open, closed, killed.
    # @option options [String] :order. Defaults to "desc". Choices: asc, desc
    # @example Return list of (all) threads for forum 'myforum', including closed ones and related forums.
    #   Disqus.listThreads("myforum", {:related => ["forum"], :include => ["close"]})
    # @see: http://disqus.com/api/3.0/forums/listThreads.json
    def listThreads(forum, options = {})
      # NOTE: extract :thread to tie it up
      response = get('forums/listThreads', forum, options)
    end
    
  end
end