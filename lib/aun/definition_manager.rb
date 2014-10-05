# encoding: utf-8
require 'csv'

module Aun
  class DefinitionManager
    AUNDEFINITION_FILE = 'Aundefinition.csv'
    AUNDEFINITION_TEMPLATE = <<-EOS
阿(例：海賊王に),吽(例：俺はなる),発言者(モンキー・D・ルフィ※不明の場合は空欄に),原典(One Piece※不明の場合は空欄に)
    EOS

    module AunDefinitionColumns
      A = 0
      UN = 1
      OWNER = 2
      ORIGIN = 3
    end

    def init
      File.open(AUNDEFINITION_FILE, 'w:UTF-8') do |f|
        f.puts AUNDEFINITION_TEMPLATE
      end
    end

    # rubocop:disable MethodLength

    # load_user_definition
    def load_user_definition
      return [] unless File.exist?(AUNDEFINITION_FILE)
      memo = []
      CSV.foreach(AUNDEFINITION_FILE, encoding: 'utf-8') do |row|
        owner = row[AunDefinitionColumns::OWNER]
        origin = row[AunDefinitionColumns::ORIGIN]
        memo << Aun::Message.new(
          row[AunDefinitionColumns::A],
          row[AunDefinitionColumns::UN],
          owner: owner, origin: origin, user_defined: true)
      end
      memo
    end
    # rubocop:enable MethodLength

    private
    def empty_to_unknown(target)
      target.empty? ? :unknown : target
    end
  end
end
