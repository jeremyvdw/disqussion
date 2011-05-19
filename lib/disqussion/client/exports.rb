module Disqussion
  class Exports < Client
    # Export a forum
    # @accessibility: public key, secret key
    # @methods: POST
    # @format: json, jsonp
    # @authenticated: true
    # @limited: false
    # @param forum [String] Forum short name (aka forum id).
    # @return [Hashie::Rash] Export infos
    # @param options [Hash] A customizable set of options.
    # @option options [String] :format. Defaults to "xml". Choices: xml, xml-old
    # @example Export forum "the88"
    #   Disqussion::Client.exports.exportForum("the88")
    # @see: http://disqus.com/api/3.0/exports/exportForum.json
    def exportForum(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      if args.size == 1
        options.merge!(:forum => args[0])
        response = post('exports/exportForum', options)
      else
        puts "#{Kernel.caller.first}: exports.exportForum expects an arguments: forum"
      end
    end
  end
end
