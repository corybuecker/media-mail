# frozen_string_literal: true

class ContentParser
  def self.parse(contents:)
    new(contents).parse
  end

  def initialize(contents)
    self.document = Nokogiri.parse(contents)
  end

  def parse
    Kramdown::Document.new(paragraphs).to_html
  end

  private

  attr_accessor :document

  def paragraphs
    document.search('p').collect(&:text).join("\n\n")
  end
end
