# frozen_string_literal: true

class TitleParser
  def self.parse(contents:)
    new(contents).parse
  end

  def initialize(contents)
    self.document = Nokogiri.parse(contents)
  end

  def parse
    [
      document.search('head title')&.text&.strip,
      document.search('body h1')&.first&.text&.strip,
      'Unknown'
    ].compact.first
  end

  private

  attr_accessor :document
end
