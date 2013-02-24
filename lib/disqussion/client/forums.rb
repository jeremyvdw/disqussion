module Disqussion
  class Forums < Client
    # Creates a new forum.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param website [String] Disqus website name.
    # @param name [String] Forum name.
    # @param short_name [String] Forum short name (aka forum id).
    # @return [Hashie::Rash] New forum infos
    # @example Creates a new forum 'myforum'
    #   Disqussion::Client.forums.create("the88", "My Forum", "myforum")
    # @see: http://disqus.com/api/3.0/forums/create.json
    def create(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      if args.size == 3
        options.merge!(:website => args[0], :name => args[1], :short_name => args[2])
        response = get('forums/create', options)
      else
        puts "#{Kernel.caller.first}: forums.create expects 3 arguments: website, name, short_name"
      end
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
    #   Disqussion::Client.forums.details("myforum")
    # @see: http://disqus.com/api/3.0/forums/details.json
    def details(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:forum] = args.first
      response = get('forums/details', options)
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
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [String] :order. Defaults to "asc". Choices: asc, desc
    # @example Return list of categories within forum 'myforum'
    #   Disqussion::Client.categories.list("myforum", {:cursor => 10, :limit => 10, :order => 'asc'})
    # @see: http://disqus.com/api/3.0/forums/listCategories.json
    def listCategories(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:forum] = args.first
      response = get('forums/listCategories', options)
    end

    # Returns a list of Moderators for the forum
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param forum [String] Forum ID (aka short name).
    # @return [Hashie::Rash] Details on the requested list of moderators.
    # @example Return list of moderators within forum 'the88'
    #   Disqussion::Client.forums.listModerators("the88")
    # @see: http://disqus.com/api/3.0/forums/listModerators.json
    def listModerators(*args)
    	options = args.last.is_a?(Hash) ? args.pop : {}
    	options[:forum] = args.first
    	response = get('forums/listModerators', options)
    end

    # Returns a list of the most active users for the forum
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param forum [String] Forum ID (aka short name).
    # @return [Hashie::Rash] Details on the requested list of most active users.
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum value of 100
    # @option options [String] :order. Defaults to "asc". Choices: asc, desc
    # @example Return list of most active users within forum 'the88'
    #   Disqussion::Client.forums.listMostActiveUsers("the88")
    # @see: http://disqus.com/api/3.0/forums/listMostActiveUsers.json
    def listMostActiveUsers(*args)
    	options = args.last.is_a?(Hash) ? args.pop : {}
    	options[:forum] = args.first
    	response = get('forums/listMostActiveUsers', options)
    end
    
    # Returns a list of users active within a forum ordered by most likes received.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param forum [String] Forum ID (aka short name).
    # @return [Hashie::Rash] Details on the list of posts.
    # @param options [Hash] A customizable set of options.
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [String] :order. Defaults to "desc". Choices: asc, desc
    # @example Return list of most liked users for forum 'myforum'
    #   Disqussion::Client.forums.listMostLikedUsers("myforum")
    # @see: http://disqus.com/api/3.0/forums/listMostLikedUsers.json
    def listMostLikedUsers(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:forum] = args.first
      response = get('forums/listMostLikedUsers', options)
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
    # @option options [Datetime, Timestamp] :since. Defaults to null. Unix timestamp (or ISO datetime standard).
    # @option options [Integer, String] :related. Allows multiple. Defaults to []. You may specify relations to include with your response. Choices: thread.
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum number of posts to return. Maximum length of 100
    # @option options [Integer] :query. Defaults to null. 
    # @option options [String, Array] :include allows multiple. Defaults to ["approved"]. Choices: unapproved, approved, spam, deleted, flagged
    # @option options [String] :order. Defaults to "desc". Choices: asc, desc
    # @example Return list of (all) posts for forum 'myforum', including related threads
    #   Disqussion::Client.forums.listPosts("myforum", {:related => ["thread"], :include => ["spam", "deleted", "flagged"]})
    # @see: http://disqus.com/api/3.0/forums/listPosts.json
    def listPosts(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:forum] = args.first
      response = get('forums/listPosts', options)
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
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer, String] :related. Allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, author.
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [String, Array] :include allows multiple. Defaults to ["open", "close"]. Choices: open, closed, killed.
    # @option options [String] :order. Defaults to "desc". Choices: asc, desc
    # @example Return list of (all) threads for forum 'myforum', including closed ones and related forums.
    #   Disqussion::Client.forums.listThreads("myforum", {:related => ["forum"], :include => ["close"]})
    # @see: http://disqus.com/api/3.0/forums/listThreads.json
    def listThreads(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:forum] = args.first
      response = get('forums/listThreads', options)
    end
    
    # Returns a list of users active within a forum.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param forum [String] Forum ID (aka short name).
    # @return [Hashie::Rash] Details on the list of posts.
    # @param options [Hash] A customizable set of options.
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [String] :order. Defaults to "desc". Choices: asc, desc
    # @example Return list of active users for forum 'myforum'
    #   Disqussion::Client.forums.listUsers("myforum")
    # @see: http://disqus.com/api/3.0/forums/listUsers.json
    def listUsers(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:forum] = args.first
      response = get('forums/listUsers', options)
    end
  end
end