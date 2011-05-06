# -*- encoding: utf-8 -*-
module Disqussion
  class Client
    # @private
    module Utils
      private

      # Take a single user ID or screen name and merge it into an options hash with the correct key
      #
      # @param user_id_or_username [Integer, String] A Disqus user ID or username.
      # @param options [Hash] A customizable set of options.
      # @return [Hash]
      def merge_user_into_options!(user_id_or_username, options={})
        case user_id_or_username
        when Fixnum
          options[:user] = user_id_or_username
        when String
          options[:"user:username"] = user_id_or_username
        end
        options
      end

      # Take a single user ID or screen name and merge it into an options hash with the correct key
      #
      # @param user_id_or_username [Integer, String] A Disqus user ID or username.
      # @param options [Hash] A customizable set of options.
      # @return [Hash]
      def merge_target_into_options!(user_id_or_username, options={})
        case user_id_or_username
        when Fixnum
          options[:target] = user_id_or_username
        when String
          options[:"target:username"] = user_id_or_username
        end
        options
      end

      # Take a multiple user IDs and screen names and merge them into an options hash with the correct keys
      #
      # @param users_id_or_usernames [Array] An array of Disqus user IDs or usernames.
      # @param options [Hash] A customizable set of options.
      # @return [Hash]
      def merge_users_into_options!(user_ids_or_usernames, options={})
        user_ids, usernames = [], []
        user_ids_or_usernames.flatten.each do |user_id_or_username|
          case user_id_or_username
          when Fixnum
            user_ids << user_id_or_username
          when String
            usernames << user_id_or_username
          end
        end
        options[:user_id] = user_ids.join(',') unless user_ids.empty?
        options[:username] = usernames.join(',') unless usernames.empty?
        options
      end

      # Take a single owner ID or owner screen name and merge it into an options hash with the correct key
      # (for Disqus API endpoints that want :owner_id and :owner_username)
      #
      # @param owner_id_or_owner_username [Integer, String] A Disqus user ID or username.
      # @param options [Hash] A customizable set of options.
      # @return [Hash]
      def merge_owner_into_options!(owner_id_or_owner_username, options={})
        case owner_id_or_owner_username
        when Fixnum
          options[:owner_id] = owner_id_or_owner_username
        when String
          options[:owner_username] = owner_id_or_owner_username
        end
        options
      end

      # Take a single list ID or slug and merge it into an options hash with the correct key
      #
      # @param list_id_or_slug [Integer, String] A Disqus list ID or slug.
      # @param options [Hash] A customizable set of options.
      # @return [Hash]
      def merge_list_into_options!(list_id_or_username, options={})
        case list_id_or_username
        when Fixnum
          options[:list_id] = list_id_or_username
        when String
          options[:slug] = list_id_or_username
        end
        options
      end
    end
  end
end