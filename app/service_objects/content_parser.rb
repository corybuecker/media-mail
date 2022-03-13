# frozen_string_literal: true

class ContentParser
  def self.parse(contents:)
    new(contents).parse
  end

  def initialize(contents)
    self.document = Nokogiri.parse(contents)
  end

  def parse
    Sanitize.fragment(document.search('body').first, Sanitize::Config::BASIC)
  end

  private

  attr_accessor :document
end
