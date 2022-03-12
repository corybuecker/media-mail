# frozen_string_literal: true

class TitleParser
  def self.parse(contents:)
    new(contents).parse
  end

  def initialize(contents)
    self.document = Nokogiri.parse(contents)
  end

  def parse
    document.css('h1')&.first&.text&.strip || 'Unknown'
  end

  private

  attr_accessor :document
end
