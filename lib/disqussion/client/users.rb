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
    #   Disqus.user("the88")
    #   Disqus.user(6138058)  # Same as above
    # @see: http://disqus.com/api/3.0/users/details.json
    def details(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      user = args.first
      merge_user_into_options!(user, options)
      response = get('users/details', options)
    end
    
    # Follow a user
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param target [Integer, String] A Disqus user ID or screen name.
    # @return [Hashie::Rash] Details on the requested user.
    # @example Return extended information for 'the88'
    #   Disqus.follow("the88")
    #   Disqus.follow(6138058)  # Same as above
    # @see: http://disqus.com/api/3.0/users/details.json
    def follow(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      target = args.first
      merge_target_into_options!(target, options)
      response = post('users/follow', options)
    end
    
    # Returns a list of forums a user has been active on.
    def listActiveForums
      
    end
    
    # BETA
    # Returns a list of threads a user has participated in sorted by last activity.
    def listActiveThreads
      
    end
    
    # BETA
    # Returns a list of various activity types made by the user.
    def listActivity
      
    end
    
    # BETA
    # Returns a list of users a user is being followed by.
    def listFollowers
      
    end
    
    # BETA
    # Returns a list of users a user is following.
    def listFollowing
      
    end

    # Returns a list of forums a user owns.
    def listForums
      
    end
    
    # BETA
    # Returns a list of forums a user has been active on recenty, sorted by the user's activity.
    def listMostActiveForums
      
    end
    
    # Returns a list of posts made by the user.
    def listPosts
      
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
    #   Disqus.unfollow("the88")
    #   Disqus.unfollow(6138058)  # Same as above
    # @see: http://disqus.com/api/3.0/users/details.json
    def unfollow
      merge_user_into_options!(user, options)
      response = post('users/unfollow', options)
    end
  end
end