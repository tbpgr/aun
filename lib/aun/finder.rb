require 'aun/message'
require 'aun/default_messages'

module Aun
  class Finder
    attr_reader :messages
    def initialize
      @messages = Aun::DefaultMessages::MESSAGES
    end

    %i(talk owner_talk talk_with_origin inspect).each do |m|
      define_method m do |key|
        message = @messages.select { |e|e.a == key }
        message.empty? ? '' : message.sample.send(m)
      end
    end

    def inspect_all
      @messages.map(&:inspect).join("\n")
    end

    def aun_definitions
      @messages
    end

    def add_messages(messages = [])
      @messages += messages
    end
  end
end
