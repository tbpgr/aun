# encoding: utf-8
require 'spec_helper'
require 'aun/finder'
require 'aun/default_messages'

describe Aun::Finder do
  context :talk do
    cases = [
      {
        case_no: 1,
        case_title: 'valid key',
        key: '君名前は？',
        expected: '田原年彦'
      },
      {
        case_no: 2,
        case_title: 'not exist key',
        key: '山んば',
        expected: ''
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          actual = aun_message.talk(c[:key])

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :owner_talk do
    cases = [
      {
        case_no: 1,
        case_title: 'valid key',
        key: '君名前は？',
        expected: '田原年彦「田原年彦」'
      },
      {
        case_no: 2,
        case_title: 'not exist key',
        key: '山んば',
        expected: ''
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          actual = aun_message.owner_talk(c[:key])

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :talk_with_origin do
    cases = [
      {
        case_no: 1,
        case_title: 'valid key',
        key: '君名前は？',
        expected: '田原年彦「田原年彦」 from [行け!稲中卓球部]'
      },
      {
        case_no: 2,
        case_title: 'not exist key',
        key: '山んば',
        expected: ''
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          actual = aun_message.talk_with_origin(c[:key])

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :inspect do
    cases = [
      {
        case_no: 1,
        case_title: 'valid key',
        key: '君名前は？',
        expected: "阿:君名前は？\t吽:田原年彦\t発言者:田原年彦\t原典:行け!稲中卓球部,\tユーザー定義:false"
      },
      {
        case_no: 2,
        case_title: 'not exist key',
        key: '山んば',
        expected: ''
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          actual = aun_message.inspect(c[:key])

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :inspect_all do
    cases = [
      {
        case_no: 1,
        case_title: 'valid key',
        expected: <<-EOS
阿:君名前は？\t吽:田原年彦\t発言者:田原年彦\t原典:行け!稲中卓球部,\tユーザー定義:false
阿:山\t吽:川\t発言者:unknown\t原典:unknown,\tユーザー定義:false
阿:ぬるぽ\t吽:ガッ\t発言者:unknown\t原典:unknown,\tユーザー定義:false
        EOS
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          actual = aun_message.inspect_all

          # -- then --
          expect(actual).to eq(c[:expected].chomp)
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :aun_definitions do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        expected: Aun::DefaultMessages::MESSAGES
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          # TODO: implement execute code
          actual = aun_message.aun_definitions

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :add_messages do
    ADDITIONAL_MESSAGES = [
      Aun::Message.new(
        'んーばばんばんば',
        'めらっさめらっさ',
        owner: 'パプワくん',
        origin: '南国少年パプワくん',
        user_defined: true
      ),
      Aun::Message.new(
        'ツー',
        'カー',
        user_defined: true
      )
        ]

    cases = [
      {
        case_no: 1,
        case_title: 'case_title',
        messages: ADDITIONAL_MESSAGES,
        expected: Aun::DefaultMessages::MESSAGES + ADDITIONAL_MESSAGES
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          aun_message.add_messages(c[:messages])
          actual = aun_message.messages

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end
end
