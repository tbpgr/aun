# encoding: utf-8
require 'spec_helper'
require 'aun/message'

describe Aun::Message do
  context :talk do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        a: 'んーばばんばんば',
        un: 'めらっさめらっさ',
        owner: 'パプワくん',
        origin: '南国少年パプワくん',
        user_defined: true,
        expected: 'めらっさめらっさ',
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Message.new(
            c[:a],
            c[:un],
            owner: c[:owner],
            origin: c[:origin],
            user_defined: c[:user_defined]
          )

          # -- when --
          actual = aun_message.talk

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
        case_title: 'valid case',
        a: 'んーばばんばんば',
        un: 'めらっさめらっさ',
        owner: 'パプワくん',
        origin: '南国少年パプワくん',
        user_defined: true,
        expected: 'パプワくん「めらっさめらっさ」',
      },
      {
        case_no: 2,
        case_title: 'no owner case',
        a: 'んーばばんばんば',
        un: 'めらっさめらっさ',
        owner: :unknown,
        origin: '南国少年パプワくん',
        user_defined: true,
        expected: 'めらっさめらっさ',
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Message.new(
            c[:a],
            c[:un],
            owner: c[:owner],
            origin: c[:origin],
            user_defined: c[:user_defined]
          )
          # -- when --
          actual = aun_message.owner_talk

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
        case_title: 'valid case',
        a: 'んーばばんばんば',
        un: 'めらっさめらっさ',
        owner: 'パプワくん',
        origin: '南国少年パプワくん',
        user_defined: true,
        expected: 'パプワくん「めらっさめらっさ」 from [南国少年パプワくん]',
      },
      {
        case_no: 2,
        case_title: 'no owner case',
        a: 'んーばばんばんば',
        un: 'めらっさめらっさ',
        owner: :unknown,
        origin: '南国少年パプワくん',
        user_defined: true,
        expected: 'めらっさめらっさ from [南国少年パプワくん]',
      },
      {
        case_no: 3,
        case_title: 'no origin case',
        a: 'んーばばんばんば',
        un: 'めらっさめらっさ',
        owner: 'パプワくん',
        origin: :unknown,
        user_defined: true,
        expected: 'パプワくん「めらっさめらっさ」',
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Message.new(
            c[:a],
            c[:un],
            owner: c[:owner],
            origin: c[:origin],
            user_defined: c[:user_defined]
          )
          # -- when --
          actual = aun_message.talk_with_origin

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
        case_title: 'valid case',
        a: 'んーばばんばんば',
        un: 'めらっさめらっさ',
        owner: 'パプワくん',
        origin: '南国少年パプワくん',
        user_defined: true,
        expected: "阿:んーばばんばんば\t吽:めらっさめらっさ\t発言者:パプワくん\t原典:南国少年パプワくん,\tユーザー定義:true"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Message.new(
            c[:a],
            c[:un],
            owner: c[:owner],
            origin: c[:origin],
            user_defined: c[:user_defined]
          )

          # -- when --
          actual = aun_message.inspect

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

  context :columns do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        a: 'んーばばんばんば',
        un: 'めらっさめらっさ',
        owner: 'パプワくん',
        origin: '南国少年パプワくん',
        user_defined: true,
        expected: ['んーばばんばんば', 'めらっさめらっさ', 'パプワくん', '南国少年パプワくん', true]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          aun_message = Aun::Message.new(
            c[:a],
            c[:un],
            owner: c[:owner],
            origin: c[:origin],
            user_defined: c[:user_defined]
          )

          # -- when --
          actual = aun_message.columns

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
