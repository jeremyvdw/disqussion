require 'disqussion/error'
require 'disqussion/configuration'
require 'disqussion/api'
require 'disqussion/client'

module Disqussion
  extend Configuration

  # Alias for Disqussion::Client.new
  #
  # @return [Disqussion::Client]
  def self.client(options={})
    Disqussion::Client.new(options)
  end

  # Delegate to Disqussion::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  def self.respond_to?(method, include_private = false)
    client.respond_to?(method, include_private) || super(method, include_private)
  end
end