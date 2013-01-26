module Disqussion
  class Users < Client
    # Returns details of a user
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param user [Integer, String] A Disqus user ID or screen name.
    # @return [Hashie::Rash] Details on the requested user.
    # @example Return extended information for 'the88'
    #   Disqussion::Client.user("the88")
    #   Disqussion::Client.user(1234)  # Same as above
    # @see: http://disqus.com/api/3.0/users/details.json
    def details(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      user = args.first
      merge_user_into_options!(user, options)
      response = get('users/details', options)
    end
    
    # Follow a user
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param target [Integer, String] A Disqus user ID or screen name.
    # @return [Hashie::Rash] Details on the requested user.
    # @example Return extended information for 'the88'
    #   Disqussion::Client.follow("the88")
    #   Disqussion::Client.follow(1234)  # Same as above
    # @see: http://disqus.com/api/3.0/users/details.json
    def follow(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      target = args.first
      merge_target_into_options!(target, options)
      response = post('users/follow', options)
    end
    
    # Returns a list of forums a user has been active on.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @return [Hashie::Rash] Details on the list of posts.
    # @param options [Hash] A customizable set of options.
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :user. Defaults to null. Looks up a user by ID. You may look up a user by username using the 'username' query type.
    # @option options [String] :order. Defaults to "desc". Choices: asc, desc
    # @example Return a list of forums user 1234 has been active on
    #   Disqussion::Client.users.listActiveForums(:user => 1234)
    # @see: http://disqus.com/api/3.0/users/listActiveForums.json
    def listActiveForums(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('users/listActiveForums', options)
    end
    
    # BETA
    # Returns a list of threads a user has participated in sorted by last activity.
     def listActiveThreads(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('users/listActiveThreads', options)
    end
    
    # BETA
    # Returns a list of various activity types made by the user.
    def listActivity(*args)
      
    end
    
    # BETA
    # Returns a list of users a user is being followed by.
    def listFollowers(*args)
      
    end
    
    # BETA
    # Returns a list of users a user is following.
    def listFollowing(*args)
      
    end
    
    # Returns a list of forums a user owns.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @return [Hashie::Rash] Details on the list of forums.
    # @param options [Hash] A customizable set of options.
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :user. Defaults to null. Looks up a user by ID. You may look up a user by username using the 'username' query type.
    # @option options [String] :order. Defaults to "desc". Choices: asc, desc
    # @example Return a list of forums owned by user 1234
    #   Disqussion::Client.users.listForums(:user => 1234)
    # @see: http://disqus.com/api/3.0/users/listForums.json
    def listForums(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('users/listForums', options)
    end
    
    # BETA
    # Returns a list of forums a user has been active on recenty, sorted by the user's activity.
    def listMostActiveForums(*args)
      
    end
    
    # Returns a list of posts made by the user.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @return [Hashie::Rash] Details on the list of forums.
    # @param options [Hash] A customizable set of options.
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer, String] :related. Allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, thread.
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :user. Defaults to null. Looks up a user by ID. You may look up a user by username using the 'username' query type.
    # @option options [String, Array] :include. Allows multiple. Defaults to ["approved"]. Choices: unapproved, approved, spam, deleted, flagged, highlighted
    # @option options [String] :order. Defaults to "desc". Choices: asc, desc
    # @example Return a list of user 1234s posts
    #   Disqussion::Client.users.listPosts(:user => 1234)
    # @see: http://disqus.com/api/3.0/users/listPosts.json
    def listPosts(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('users/listPosts', options)
    end
    
    # Unfollow a user
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param user [Integer, String] A Disqus user ID or screen name.
    # @return [Hashie::Rash] Details on the requested user.
    # @example Return extended information for 'the88'
    #   Disqussion::Client.unfollow("the88")
    #   Disqussion::Client.unfollow(1234)  # Same as above
    # @see: http://disqus.com/api/3.0/users/details.json
    def unfollow(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      target = args.first
      merge_target_into_options!(target, options)
      response = post('users/unfollow', options)
    end
  end
end