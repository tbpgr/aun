require 'aun/message'

module Aun
  # MessageFormatter
  class MessageFormatter
    KEYS = %w(A Un Owner Origin UserDefined)

    def self.csv_hearer
      KEYS.join(',')
    end

    def self.csv(message)
      message.columns.join(',')
    end

    def self.markdown_table_header
      header = <<-EOS
|#{KEYS.join('|')}|
#{'|:--' * KEYS.size}|
      EOS
      header.chomp
    end

    def self.markdown_table(message)
      "|#{message.columns.join('|')}|"
    end
  end
end
