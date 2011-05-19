module Disqussion
  class Categories < Client
    # Creates a new category.
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param forum [String] Looks up a forum by ID (aka short name)
    # @param title [String] Maximum length of 50
    # @param options [Hash] A customizable set of options.
    # @option options [String] :default. Defaults to false.
    # @return [Hashie::Rash] New category infos 
    # @example Creates a new category "My category" in forum "the88"
    #   Disqussion::Client.categories.create("the88", "My category")
    # @see: http://disqus.com/api/3.0/categories/create.json
    def create(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      if args.size == 2
        options.merge!(:forum => args[0], :title => args[1])
        response = post('categories/create', options)
      else
        puts "#{Kernel.caller.first}: categories.create expects 2 arguments: forum, title"
      end
    end
    
    # Returns category details.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @param category [Integer] Looks up a category by ID.
    # @return [Hashie::Rash] Details on the requested category.
    # @example 
    #   Disqussion::Client.categories.details(19122)
    # @see: http://disqus.com/api/3.0/categories/details.json
    def details(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:category] = args.first
      response = get('categories/details', options)
    end
    
    # Returns a list of categories within a forum.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp
    # @authenticated: false
    # @limited: false
    # @return [Hashie::Rash] Details on the requested list of categories.
    # @param options [Hash] A customizable set of options.
    # @option options [Array, String] :forum allow multiple. Defaults to null. Looks up a forum by ID (aka short name)
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null
    # @option options [Integer] :cursor. Defaults to null
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [String] :order. Defaults to "asc". Choices: asc, desc
    # @example Return list of categories within forum 'myforum'
    #   Disqussion::Client.categories.list("myforum", {:cursor => 10, :limit => 10, :order => 'asc'})
    # @see: http://disqus.com/api/3.0/categories/list.json
    def list(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      response = get('categories/list', options)
    end
    
    # Returns a list of posts within a category.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp, rss
    # @authenticated: false
    # @limited: false
    # @param forum [Integer] Category ID.
    # @return [Hashie::Rash] Details on the requested list of posts.
    # @param options [Hash] A customizable set of options.
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null.
    # @option options [Integer, String] :related. Allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, thread.
    # @option options [Integer] :cursor. Defaults to null.
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :query. Defaults to null. 
    # @option options [String, Array] :include. allows multiple. Defaults to ["approved"]. Choices: unapproved, approved, spam, deleted, flagged.
    # @option options [String] :order. Defaults to "asc". Choices: asc, desc.
    # @example Return list of posts within category 827231
    #   Disqussion::Client.categories.listPosts(827231, {:cursor => 10, :limit => 10, :order => 'asc'})
    # @see: http://disqus.com/api/3.0/categories/listPosts.json
    def listPosts(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:category] = args.first
      response = get('categories/listPosts', options)
    end
    
    # Returns a list of threads within a category sorted by the date created.
    # @accessibility: public key, secret key
    # @methods: GET
    # @format: json, jsonp, rss
    # @authenticated: false
    # @limited: false
    # @param forum [Integer] Category ID.
    # @return [Hashie::Rash] Details on the requested list of threads.
    # @param options [Hash] A customizable set of options.
    # @option options [Datetime, Timestamp] :since. Unix timestamp (or ISO datetime standard). Defaults to null.
    # @option options [Integer, String] :related. Allows multiple. Defaults to []. You may specify relations to include with your response. Choices: forum, thread.
    # @option options [Integer] :cursor. Defaults to null.
    # @option options [Integer] :limit. Defaults to 25. Maximum length of 100
    # @option options [Integer] :query. Defaults to null. 
    # @option options [String, Array] :include. allows multiple. Defaults to ["approved"]. Choices: unapproved, approved, spam, deleted, flagged.
    # @option options [String] :order. Defaults to "asc". Choices: asc, desc.
    # @example Return list of threads within category 827231
    #   Disqussion::Client.categories.listThreads(827231, {:cursor => 10, :limit => 10, :order => 'asc'})
    # @see: http://disqus.com/api/3.0/categories/listThreads.json
    def listThreads(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options[:category] = args.first
      response = get('categories/listThreads', options)
    end
  end
end