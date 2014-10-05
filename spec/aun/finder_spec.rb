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
      },
      {
        case_no: 3,
        case_title: 'valid key with origin filter',
        key: 'ゆ・・・ゆるさん・・・',
        origin_filter: 'ドラゴンボール',
        expected: 'ぜったいにゆるさんぞ虫ケラども!!!'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          actual =
            if c[:origin_filter]
              aun_message.talk(c[:key], c[:origin_filter])
            else
              aun_message.talk(c[:key])
            end

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
      },
      {
        case_no: 3,
        case_title: 'valid key with origin filter',
        key: 'ゆ・・・ゆるさん・・・',
        origin_filter: 'ドラゴンボール',
        expected: 'フリーザ「ぜったいにゆるさんぞ虫ケラども!!!」'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          actual =
            if c[:origin_filter]
              aun_message.owner_talk(c[:key], c[:origin_filter])
            else
              aun_message.owner_talk(c[:key])
            end

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
      },
      {
        case_no: 3,
        case_title: 'valid key with origin filter',
        key: 'ゆ・・・ゆるさん・・・',
        origin_filter: 'ドラゴンボール',
        expected: 'フリーザ「ぜったいにゆるさんぞ虫ケラども!!!」 from [ドラゴンボール]'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          actual =
            if c[:origin_filter]
              aun_message.talk_with_origin(c[:key], c[:origin_filter])
            else
              aun_message.talk_with_origin(c[:key])
            end

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
      },
      {
        case_no: 3,
        case_title: 'valid key with origin filter',
        key: 'ゆ・・・ゆるさん・・・',
        origin_filter: 'ドラゴンボール',
        expected: "阿:ゆ・・・ゆるさん・・・\t吽:ぜったいにゆるさんぞ虫ケラども!!!\t発言者:フリーザ\t原典:ドラゴンボール,\tユーザー定義:false"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          actual =
            if c[:origin_filter]
              aun_message.inspect(c[:key], c[:origin_filter])
            else
              aun_message.inspect(c[:key])
            end

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
阿:もうおわりだ\t吽:戸棚のウラはネズミの卵でいっぱいだー！\t発言者:二階堂昭夫\t原典:動物のお医者さん,\tユーザー定義:false
阿:オス\t吽:オラ悟空\t発言者:孫悟空\t原典:ドラゴンボール,\tユーザー定義:false
阿:今度は木っ端微塵にしてやる。あの地球人のように\t吽:クリリンのことか───────っ!!!!!\t発言者:孫悟空\t原典:ドラゴンボール,\tユーザー定義:false
阿:ゆ・・・ゆるさん・・・\t吽:ぜったいにゆるさんぞ虫ケラども!!!\t発言者:フリーザ\t原典:ドラゴンボール,\tユーザー定義:false
阿:ゆ・・・ゆるさん・・・\t吽:ぜったいにゆるさんぞ虫ケラども!!!\t発言者:山田 太郎\t原典:珍遊記,\tユーザー定義:false
        EOS
      },
      {
        case_no: 2,
        case_title: 'valid key with origin filter',
        origin_filter: 'ドラゴンボール',
        expected: <<-EOS
阿:オス\t吽:オラ悟空\t発言者:孫悟空\t原典:ドラゴンボール,\tユーザー定義:false
阿:今度は木っ端微塵にしてやる。あの地球人のように\t吽:クリリンのことか───────っ!!!!!\t発言者:孫悟空\t原典:ドラゴンボール,\tユーザー定義:false
阿:ゆ・・・ゆるさん・・・\t吽:ぜったいにゆるさんぞ虫ケラども!!!\t発言者:フリーザ\t原典:ドラゴンボール,\tユーザー定義:false
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
          actual =
            if c[:origin_filter]
              aun_message.inspect_all(c[:origin_filter])
            else
              aun_message.inspect_all
            end

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
      },
      {
        case_no: 1,
        case_title: 'valid case',
        origin_filter: 'ドラゴンボール',
        expected: Aun::DefaultMessages::MESSAGES.select { |e|e.origin == 'ドラゴンボール' }
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Finder.new

          # -- when --
          actual =
            if c[:origin_filter]
              aun_message.aun_definitions(c[:origin_filter])
            else
              aun_message.aun_definitions
            end

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
