require 'aun/message'
require 'aun/default_messages'

module Aun
  class Finder
    attr_reader :messages
    def initialize
      @messages = Aun::DefaultMessages::MESSAGES
    end

    %i(talk owner_talk talk_with_origin inspect).each do |m|
      define_method m do |key, origin_filter = ''|
        message =
          if origin_filter && origin_filter.empty?
            @messages.select { |e|e.a == key }
          else
            @messages.select { |e|e.origin == origin_filter }
                     .select { |e|e.a == key }
          end
        message.empty? ? '' : message.sample.send(m)
      end
    end

    def inspect_all(origin_filter = '')
      if origin_filter && origin_filter.empty?
        @messages.map(&:inspect).join("\n")
      else
        @messages.select { |e|e.origin == origin_filter }
                 .map(&:inspect).join("\n")
      end
    end

    def aun_definitions(origin_filter = '')
      return @messages if origin_filter.empty?
      @messages.select { |e|e.origin == origin_filter }
    end

    def add_messages(messages = [])
      @messages += messages
    end
  end
end
