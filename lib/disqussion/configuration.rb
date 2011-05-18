require 'faraday'
require 'disqussion/version'

module Disqussion
  # Defines constants and methods related to configuration
  module Configuration
    # An array of valid keys in the options hash when configuring a {Disqussion::API}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :endpoint,
      :api_key,
      :api_secret,
      :developer,
      :container_id,
      :avatar_size,
      :color,
      :default_tab,
      :hide_avatars,
      :hide_mods,
      :num_items,
      :show_powered_by,
      :orientation,
      :format,
      :proxy,
      :user_agent].freeze

    # An array of valid request/response formats
    #
    # @note only json for now
    VALID_FORMATS = [:json].freeze

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = Faraday.default_adapter

    # By default, don't set an application key
    DEFAULT_API_KEY = nil

    # By default, don't set an application secret
    DEFAULT_API_SECRET = nil

    # The endpoint that will be used to connect if none is set
    #
    # @note This is configurable in case you want to use HTTP instead of HTTPS, specify a different API version, or use a Disqussion-compatible endpoint.
    # @see http://status.net/wiki/Disqussion-compatible_API
    # @see http://en.blog.wordpress.com/2009/12/12/disqussion-api/
    # @see http://staff.tumblr.com/post/287703110/api
    # @see http://developer.typepad.com/typepad-disqussion-api/disqussion-api.html
    DEFAULT_API_VERSION = '3.0'.freeze
    DEFAULT_ENDPOINT = "https://disqus.com/api/#{DEFAULT_API_VERSION}/".freeze

    # The response format appended to the path and sent in the 'Accept' header if none is set
    #
    # @note JSON is preferred over XML because it is more concise and faster to parse.
    DEFAULT_FORMAT = :json

    # By default, don't use a proxy server
    DEFAULT_PROXY = nil

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "Disqussion Ruby Gem #{Disqussion::VERSION}".freeze

    DEFAULT_DEVELOPER       = false
    DEFAULT_CONTAINER_ID    = 'disqus_thread'
    DEFAULT_AVATAR_SIZE     = 48
    DEFAULT_COLOR           = "grey"
    DEFAULT_DEFAULT_TAB     = "popular"
    DEFAULT_HIDE_AVATARS    = false
    DEFAULT_HIDE_MODS       = true
    DEFAULT_NUM_ITEMS       = 15
    DEFAULT_SHOW_POWERED_BY = true
    DEFAULT_ORIENTATION     = "horizontal"

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k) }
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter            = DEFAULT_ADAPTER
      self.endpoint           = DEFAULT_ENDPOINT
      self.api_key            = DEFAULT_API_KEY
      self.api_secret         = DEFAULT_API_SECRET
      self.developer          = DEFAULT_DEVELOPER
      self.container_id       = DEFAULT_CONTAINER_ID
      self.avatar_size        = DEFAULT_AVATAR_SIZE
      self.color              = DEFAULT_COLOR
      self.default_tab        = DEFAULT_DEFAULT_TAB
      self.hide_avatars       = DEFAULT_HIDE_AVATARS
      self.hide_mods          = DEFAULT_HIDE_MODS
      self.num_items          = DEFAULT_NUM_ITEMS
      self.show_powered_by    = DEFAULT_SHOW_POWERED_BY
      self.orientation        = DEFAULT_ORIENTATION
      self.format             = DEFAULT_FORMAT
      self.proxy              = DEFAULT_PROXY
      self.user_agent         = DEFAULT_USER_AGENT
      self
    end
  end
end
