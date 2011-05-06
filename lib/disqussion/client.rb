module Disqussion
  # Wrapper for the Disqussion REST API
  #
  # @note All methods have been separated into client classes and follow the same grouping used in {http://disqus.com/api/docs/ the Disqus API Documentation}.
  # @see http://docs.disqus.com/developers/api/
  class Client < API
    require 'disqussion/client/applications.rb'
    require 'disqussion/client/blacklists.rb'
    require 'disqussion/client/categories.rb'
    require 'disqussion/client/exports.rb'
    require 'disqussion/client/forums.rb'
    require 'disqussion/client/imports.rb'
    require 'disqussion/client/posts.rb'
    require 'disqussion/client/reactions.rb'
    require 'disqussion/client/reports.rb'
    require 'disqussion/client/threads.rb'
    require 'disqussion/client/trends.rb'
    require 'disqussion/client/users.rb'
    require 'disqussion/client/utils.rb'
    require 'disqussion/client/whitelists.rb'
    
    alias :api_endpoint :endpoint
    
    include Disqussion::Client::Utils
    
    ['applications',
    'blacklists',
    'categories',
    'exports',
    'forums',
    'imports',
    'posts',
    'reactions',
    'reports',
    'threads',
    'trends',
    'users',
    'whitelists'].each do |classname|
      class_eval <<-END
        def self.#{classname}
          Disqussion::#{classname.capitalize}.new
        end
      END
    end
  end
end