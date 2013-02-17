module Disqussion
  class Threads < Client
  	
  	# Creates a thread
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param forum [String] Looks up a forum by ID (aka forum shortname).
    # @param title [String] Title of the the new thread
    # @return [Hashie::Rash] New thread is created.
    # @option options [Integer] :category. Defaults to null
    # @option options [String] :url. Defaults to null. URL (defined by RFC 3986). Maximum length of 500
    # @option options [Integer] :date. Defaults to null. Unix timestamp (or ISO datetime standard)
    # @option options [String] :message Defaults to null
    # @option options [Integer] :identifier. Defaults to null. Maximum length of 300
    # @option options [String] :slug. Defaults to null. Alpha-numeric slug. Maximum length of 200
    # @example Create thread "Hello World"
    #   Disqussion::Client.threads.create("bobross","Hello World")
    # @see: http://disqus.com/api/3.0/threads/create.json
    def create(*args)
    	options = args.last.is_a?(Hash) ? args.pop : {}
    	if args.length == 2 
    		options.merge!(:forum => args[0])
    		options.merge!(:title => args[1])
    	 	response = post('threads/create', options)
      else
        puts "#{Kernel.caller.first}: threads.create expects 2 arguments: forum name (aka forum short name) and title for the thread"
      end
    end
    
    # Closes a thread
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param thread [Array, Integer] allows multiple. Looks up a thread by ID. You must be a moderator on the selected thread's forum. You may pass use the 'ident' or 'link' query types instead of an ID by including 'forum'.
    # @return [Hashie::Rash] ID of the closed thread.
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name). You must be a moderator on the selected forum.
    # @example Closes thread 12345678
    #   Disqussion::Client.threads.close(12345678)
    # @see: http://disqus.com/api/3.0/threads/close.json
    def close(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      thread = args.first
      options.merge!(:thread => thread) if ([:ident, :link] & options.keys).empty?
      response = post('threads/close', options)
    end

    # Returns thread details.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @return [Hashie::Rash] Details on the requested threads.
    # @param thread [Integer] Looks up a thread by ID. You must be a moderator on the selected thread's forum. You may pass use the 'ident' or 'link' query types instead of an ID by including 'forum'.
    # @param options [Hash] A customizable set of options.
    # @option options [String, Array] :related allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, author, category
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name)
    # @example Return extended information for forum 'myforum'
    #   Disqussion::Client.threads.details("mythread")
    # @see: http://disqus.com/api/3.0/threads/details.json
    def details(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      thread = args.first
      options.merge!(:thread => thread) if ([:ident, :link] & options.keys).empty?
      response = get('threads/details', options)
    end

    # Returns a list of threads sorted by the date created.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp, rss
    # @authenticated: false
    # @limited: false
    # @return [Hashie::Rash] List of threads.
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :category. Defaults to null
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name)
    # @option options [Integer] :thread. Defaults to null. Looks up a thread by ID. You may pass use the 'ident' or 'link' query types instead of an ID by including 'forum'.
    # @option options [Integer, String] :author. Defaults to null. You may look up a user by username using the 'username' query type.
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [String, Array] :related allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, author, category
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [String, Array] :include allows multiple. Defaults to ["open", "close"]. Choices: open, closed, killed.
    # @option options [String] :order. Defaults to "asc". Choices: asc, desc
    # @example Return extended information for forum 'myforum'
    #   Disqussion::Client.threads.list(:forum => "the88")
    # @see: http://disqus.com/api/3.0/threads/list.json
    def list(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('threads/list', options)
    end

    # Returns a list of threads sorted by number of likes.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp, rss
    # @authenticated: false
    # @limited: false
    # @return [Hashie::Rash] List of the most liked threads.
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :category. Defaults to null
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name)
    # @option options [Integer, String] :author. Defaults to null. You may look up a user by username using the 'username' query type.
    # @option options [String, Array] :related allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, author, category
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [String, Array] :include allows multiple. Defaults to ["open", "close"]. Choices: open, closed, killed.
    # @example Return extended information for forum 'myforum'
    #   Disqussion::Client.threads.listMostLiked()
    # @see: http://disqus.com/api/3.0/threads/listMostLiked.json
    def listMostLiked(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('threads/listMostLiked', options)
    end

    # BETA
    # Returns a list of threads sorted by hotness (date and likes).
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp, rss
    # @authenticated: false
    # @limited: false
    # @return [Hashie::Rash] List of the hottest threads sorted by hotness.
    # @option options [Integer] :category. Looks up a category by ID. Defualts to null.
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name)
    # @option options [String, Integer]  :author. Defaults to null. Looks up a user by ID. You may look up a user by username using the 'username' query type.
    # @option options [String, Array] :related. allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, author,category
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [String, Array] :include .allows multiple. Defaults to ["open", "close"]. Choices: open, closed, killed.
    # @example Return list of hottest threads of the forum specified
    #   Disqussion::Client.threadslistHot(:forum => "cnn")
    # @see: http://disqus.com/api/3.0/threads/listHot.json
    def listHot(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('threads/listHot', options)
    end

    # Returns a list of threads sorted by number of posts made since "interval". 
    # If you are using both "category" and "forum" parameters, the forum of the category must match that as the parameter value for "forum".
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp, rss
    # @authenticated: false
    # @limited: false
    # @return [Hashie::Rash] List of the most popular threads which have had the most posts in an interval.
    # @option options [Integer] :category. Looks up a category by ID. Defualts to null.
    # @option options [String] :interval. Defaults to "7d". Choices: 1h, 6h, 12h, 1d, 3d, 7d, 30d, 60d, 90d
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name)
    # @option options [String, Array] :related allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Boolean] :with_top_post. Defaults to false
    # @example Return list of the most populat threads in a given interval
    #   Disqussion::Client.threadslistPopular(:forum => "bobross")
    # @see: http://disqus.com/api/3.0/threads/listPopular.json
    def listPopular(*args)
    	options = args.last.is_a?(Hash) ? args.pop : {}
    	response = get('threads/listPopular', options)
    end 

    # Returns a list of posts within a thread.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp, rss
    # @authenticated: false
    # @limited: false
    # @return [Hashie::Rash] List of threads post.
    # @param thread [Integer] Looks up a thread by ID. You must be a moderator on the selected thread's forum. You may pass use the 'ident' or 'link' query types instead of an ID by including 'forum'.
    # @param options [Hash] A customizable set of options.
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name)
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [String, Array] :related allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :query. Defaults to null.
    # @option options [String, Array] :include allows multiple. Defaults to ["approved"]. Choices: unapproved, approved, spam, deleted, flagged
    # @option options [String] :order. Defaults to "desc". Choices: asc, desc
    # @example Return extended information for forum 'myforum'
    #   Disqussion::Client.threads.list()
    # @see: http://disqus.com/api/3.0/threads/listPosts.json
    def listPosts(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      thread = args.first
      options.merge!(:thread => thread) if ([:ident, :link] & options.keys).empty?
      response = get('threads/listPosts', options)
    end

    # Opens a thread
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param thread [Array, Integer] allows multiple. Looks up a thread by ID. You must be a moderator on the selected thread's forum. You may pass use the 'ident' or 'link' query types instead of an ID by including 'forum'.
    # @return [Hashie::Rash]  ID of the opened thread.
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name). You must be a moderator on the selected forum.
    # @example Opens thread 12345678
    #   Disqussion::Client.threads.open(12345678)
    # @see: http://disqus.com/api/3.0/threads/open.json
    def open(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      thread = args.first
      options.merge!(:thread => thread) if ([:ident, :link] & options.keys).empty?
      response = post('threads/open', options)
    end

    # Removes a thread
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param thread [Array, Integer] allows multiple. Looks up a thread by ID. You must be a moderator on the selected thread's forum. You may pass use the 'ident' or 'link' query types instead of an ID by including 'forum'.
    # @return [Hashie::Rash] ID of the deleted thread.
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name). You must be a moderator on the selected forum.
    # @example Removes thread 12345678
    #   Disqussion::Client.threads.remove(12345678)
    # @see: http://disqus.com/api/3.0/threads/remove.json
    def remove(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      thread = args.first
      options.merge!(:thread => thread) if ([:ident, :link] & options.keys).empty?
      response = post('threads/remove', options)
    end

    # Restores a thread
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param thread [Array, Integer] allows multiple. Looks up a thread by ID. You must be a moderator on the selected thread's forum. You may pass use the 'ident' or 'link' query types instead of an ID by including 'forum'.
    # @return [Hashie::Rash] ID of the restored thread.
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name). You must be a moderator on the selected forum.
    # @example Removes thread 12345678
    #   Disqussion::Client.threads.restore(12345678)
    # @see: http://disqus.com/api/3.0/threads/restore.json
    def restore(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      thread = args.first
      options.merge!(:thread => thread) if ([:ident, :link] & options.keys).empty?
      response = post('threads/restore', options)
    end

    # Returns an unsorted set of threads given a list of ids.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false 
    # @option options [String] :related. Defaults to []. You may specify relations to include with your response. Choices forum, author, category 
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name). 
    # @example Set thread 12345678
    #   Disqussion::Client.threads.set(12345678)
    # @see: http://disqus.com/api/3.0/threads/set.json
    def set(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      thread = args.first
      options.merge!(:thread => thread) if ([:ident, :link] & options.keys).empty?
      response = get('threads/set', options)
    end

    def subscribe(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = post('threads/subscribe', options)
    end

    def unsubscribe(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = post('threads/unsubscribe', options)
    end

    # Updates a thread
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param thread [Integer] Looks up by Thread ID
    # @return [Hashie::Rash] Updates a thread.
    # @option options [Integer] :category. Defaults to null
    # @option options [String] :forum. Looks up a forum by ID (aka forum shortname)
    # @option options [String] :title. Defaults to null. Maximum length of 200
    # @option options [String] :url. Defaults to null. URL (defined by RFC 3986). Maximum length of 500
    # @option options [Integer] :date. Defaults to null. Unix timestamp (or ISO datetime standard)
    # @option options [String] :message Defaults to null
    # @option options [Integer] :identifier. Defaults to null. Maximum length of 300
    # @option options [String] :slug. Defaults to null. Alpha-numeric slug. Maximum length of 200
    # @example Updates thread 1
    #   Disqussion::Client.threads.update(1,"bobross","Hello World")
    # @see: http://disqus.com/api/3.0/threads/update.json
		def update(*args)
			options = args.last.is_a?(Hash) ? args.pop : {}
      thread = args.first
      options.merge!(:thread => thread) 
			response = post('threads/update', options)
		end

    # Register a vote on a thread.
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param thread [Integer] Choices: -1, 0, 1
    # @param thread [Integer] Looks up a thread by ID. You may pass use the 'ident' or 'link' query types instead of an ID by including 'forum'.
    # @return [Hashie::Rash] Details on the thread.
    # @option options [String] :forum. Defaults to null. Looks up a forum by ID (aka short name). You must be a moderator on the selected forum.
    # @example Removes thread 12345678
    #   Disqussion::Client.threads.vote(1, 12345678)
    # @see: http://disqus.com/api/3.0/threads/vote.json
    def vote(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      if args.length == 2
        options.merge!(:vote => args[0])
        options.merge!(:thread => args[1]) if ([:ident, :link] & options.keys).empty?
        response = post('threads/vote', options)
      else
        puts "#{Kernel.caller.first}: threads.vote expects 2 arguments: vote([-1..1]), thread (you may pass use the 'ident' or 'link' query types instead of an thread ID by including :forum)"
      end
    end
  end
end
