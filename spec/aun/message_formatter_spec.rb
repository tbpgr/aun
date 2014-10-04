# encoding: utf-8
require 'spec_helper'
require 'aun/message_formatter'
require 'aun/message'

describe Aun::MessageFormatter do
  context :csv_hearer do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        expected: 'A,Un,Owner,Origin,UserDefined'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = Aun::MessageFormatter.csv_hearer

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

  context :csv do
    cases = [
      {
        case_no: 1,
        case_title: 'all columns case',
        message: Aun::Message.new(
          'んーばばんばんば',
          'めらっさめらっさ',
          owner: 'パプワくん',
          origin: '南国少年パプワくん',
          user_defined: true
        ),
        expected: 'んーばばんばんば,めらっさめらっさ,パプワくん,南国少年パプワくん,true'
      },
      {
        case_no: 2,
        case_title: 'part columns case',
        message: Aun::Message.new('ツー', 'カー', user_defined: true),
        expected: 'ツー,カー,unknown,unknown,true'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = Aun::MessageFormatter.csv(c[:message])

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

  context :markdown_table_header do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        expected: <<-EOS
|A|Un|Owner|Origin|UserDefined|
|:--|:--|:--|:--|:--|
        EOS
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = Aun::MessageFormatter.markdown_table_header

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

  context :markdown_table do
    cases = [
      {
        case_no: 1,
        case_title: 'all columns case',
        message: Aun::Message.new(
          'んーばばんばんば',
          'めらっさめらっさ',
          owner: 'パプワくん',
          origin: '南国少年パプワくん',
          user_defined: true
        ),
        expected: '|んーばばんばんば|めらっさめらっさ|パプワくん|南国少年パプワくん|true|'
      },
      {
        case_no: 2,
        case_title: 'part columns case',
        message: Aun::Message.new('ツー', 'カー', user_defined: true),
        expected: '|ツー|カー|unknown|unknown|true|'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = Aun::MessageFormatter.markdown_table(c[:message])

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
