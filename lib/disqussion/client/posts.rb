module Disqussion
  class Posts < Client
    # Approves a post.
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param post [Integer] allows multiple. Looks up a post by ID. You must be a moderator on the selected post's forum.
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
    # @param post [Integer] allows multiple. Looks up a post by ID.
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
  end
end