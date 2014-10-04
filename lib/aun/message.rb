# encoding: utf-8
module Aun
  # Message
  class Message
    attr_reader :a, :un, :owner, :origin, :user_defined
    def initialize(a, un, owner: :unknown, origin: :unknown, user_defined: false)
      @a, @un, @owner, @origin, @user_defined = a, un, owner, origin, user_defined
    end

    # talk (format '@un')
    def talk
      @un
    end

    # talk (format '@owner 「@un」')
    # if @owner is empty, (format '@un')
    def owner_talk
      return talk if unknown?(owner)
      "#{@owner}「#{talk}」"
    end

    # talk (format '@owner 「@un」 from [@origin]')
    # if @owner is empty and @origin is empty, (format '@un')
    # if @owner is empty and @origin is not empty, (format '@un' from [@origin])
    # if @owner is not empty and @origin is empty, (format '@owner 「@un」')
    def talk_with_origin
      ret = talk
      ret = "#{@owner}「#{ret}」" unless unknown?(@owner)
      ret = "#{ret} from [#{@origin}]" unless unknown?(@origin)
      ret
    end

    def inspect
      "阿:#{@a}\t吽:#{@un}\t発言者:#{@owner}\t原典:#{@origin},\tユーザー定義:#{user_defined}"
    end

    # Columns
    # @return [Array(*String)] @a, @un, @owner, @origin, @user_defined
    def columns
      [@a, @un, @owner, @origin, @user_defined]
    end

    private

    def unknown?(target)
      target == :unknown
    end
  end
end
