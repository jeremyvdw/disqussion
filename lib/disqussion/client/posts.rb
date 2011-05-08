module Disqussion
  class Posts < Client
    # Approves a post.
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param post [Array, Integer] allows multiple. Looks up a post by ID. You must be a moderator on the selected post's forum.
    # @return [Hashie::Rash] Approved post id
    # @example Approves post with ID 198230
    #   Disqussion::Client.posts.approve(198230)
    # @see: http://disqus.com/api/3.0/posts/approve.json
    def approve(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:post] = args.first
      response = post('posts/approve', options)
    end
    
    # Creates a new post.
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param message [String] Message.
    # @param options [Hash] A customizable set of options.
    # @option options [Integer] :parent Defaults to null. Looks up a post by ID
    # @option options [Integer] :thread Defaults to null. Looks up a thread by ID
    # @option options [String] :author_email Defaults to null. Email address (defined by RFC 5322)
    # @option options [String] :author_name Defaults to null
    # @option options [String] :state Defaults to null. Choices: unapproved, approved, spam, killed
    # @option options [String] :author_url Defaults to null. URL (defined by RFC 3986)
    # @option options [Datetime] :date Defaults to null. Unix timestamp (or ISO datetime standard)
    # @option options [String] :ip_address Defaults to null. IP address (defined by RFC 5322)
    # @return [Hashie::Rash] New post infos 
    # @example Creates a new post 'hello world' in 167820 167820
    #   Disqussion::Client.posts.create("hello world", :thread => 167820)
    # @see: http://disqus.com/api/3.0/posts/create.json
    def create(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:message] = args.first
      response = post('posts/create', options)
    end
    
    # Returns post details.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param post [Integer] Post ID
    # @param options [Hash] A customizable set of options.
    # @option options [Integer, String] :related. Allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, thread.
    # @return [Hashie::Rash] Details on the requested post.
    # @example Return extended information for post 193673
    #   Disqussion::Client.posts.details(193673)
    # @see: http://disqus.com/api/3.0/posts/details.json
    def details(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:post] = args.first
      response = get('posts/details', options)
    end
    
    # Highlights a post.
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param post [Array, Integer] allows multiple. Looks up a post by ID.
    # @return [Hashie::Rash] Highlighted post id
    # @example Highlights post with ID 198230
    #   Disqussion::Client.posts.highlight(198230)
    # @see: http://disqus.com/api/3.0/posts/highlight.json
    def highlight(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:post] = args.first
      response = post('posts/highlight', options)
    end
    
    # Returns a list of posts ordered by the date created.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp, rss
    # @authenticated: false
    # @limited: false
    # @param options [Hash] A customizable set of options.
    # @option options [Array, String] :category allow multiple. Defaults to null. Looks up a category by ID
    # @option options [Array, String] :thread allow multiple. Defaults to null. Looks up a thread by ID
    # @option options [Array, String] :forum allow multiple. Defaults to null. Defaults to all forums you moderate if no other filters are specified. Looks up a forum by ID (aka short name)
    # @option options [Datetime, Timestamp] :since Defaults to null. Unix timestamp (or ISO datetime standard).
    # @option options [String, Array] :related allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, thread
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :offset. Defaults to 0. Deprecated: Please see documentation on cursors
    # @option options [Integer] :query. Defaults to null.
    # @option options [String, Array] :include allows multiple. Defaults to ["approved"]. Choices: unapproved, approved, spam, deleted, flagged, highlighted
    # @option options [String] :order. Defaults to "desc". Choices: asc, desc
    # @return [Hashie::Rash] Returns a list of posts ordered by the date created..
    # @example Return list of posts for thread 193673
    #   Disqussion::Client.posts.list(:thread => 193673)
    # @see: http://disqus.com/api/3.0/posts/list.json
    def list(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('posts/list', options)
    end
    
    # Deletes the requested post(s).
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param post [Array, Integer] allows multiple. Looks up a post by ID.
    # @return [Hashie::Rash] Removed post id
    # @example Deletes post with ID 198230
    #   Disqussion::Client.posts.remove(198230)
    # @see: http://disqus.com/api/3.0/posts/remove.json
    def remove(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:post] = args.first
      response = post('posts/remove', options)
    end
    
    # Reports a post (flagging).
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param post [Integer] Looks up a post by ID.
    # @return [Hashie::Rash] Reported post id
    # @example Deletes post with ID 198230
    #   Disqussion::Client.posts.report(198230)
    # @see: http://disqus.com/api/3.0/posts/report.json
    def report(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:post] = args.first
      response = post('posts/report', options)
    end
    
    # Undeletes the requested post(s).
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param post [Array, Integer] allows multiple. Looks up a post by ID.
    # @return [Hashie::Rash] restored post id
    # @example Undeletes post with ID 198230
    #   Disqussion::Client.posts.restore(198230)
    # @see: http://disqus.com/api/3.0/posts/restore.json
    def restore(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:post] = args.first
      response = post('posts/restore', options)
    end
    
    # Marks the requested post(s) as spam.
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param post [Array, Integer] allows multiple. Looks up a post by ID.
    # @return [Hashie::Rash] Marked as spam post id
    # @example Reports as spam post with ID 198230
    #   Disqussion::Client.posts.spam(198230)
    # @see: http://disqus.com/api/3.0/posts/spam.json
    def spam(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:post] = args.first
      response = post('posts/spam', options)
    end
    
    # Unhighlights the requested post(s).
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param post [Array, Integer] allows multiple. Looks up a post by ID.
    # @return [Hashie::Rash] Unhighlighted post id
    # @example Unhighlights the requested post(s).
    #   Disqussion::Client.posts.unhighlight(198230)
    # @see: http://disqus.com/api/3.0/posts/unhighlight.json
    def unhighlight(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:post] = args.first
      response = post('posts/unhighlight', options)
    end
    
    # Register a vote for a post.
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param vote [Integer] Choices: -1, 0, 1
    # @param post [Integer] Looks up a post by ID.
    # @return [Hashie::Rash] Details on the post.
    # @example Vote for post ID 12345678
    #   Disqussion::Client.posts.vote(1, 12345678)
    # @see: http://disqus.com/api/3.0/posts/vote.json
    def vote(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      if args.length == 2
        options.merge!(:vote => args[0])
        options.merge!(:post => args[1])
        response = post('posts/vote', options)
      else
        puts "#{Kernel.caller.first}: posts.vote expects 2 arguments: vote([-1..1]), posts ID"
      end
    end
  end
end