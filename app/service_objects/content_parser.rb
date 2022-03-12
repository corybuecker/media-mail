# frozen_string_literal: true

class ContentParser
  def self.parse(contents:)
    new(contents).parse
  end

  def initialize(contents)
    self.document = Nokogiri.parse(contents)
  end

  def parse
    Kramdown::Document.new(main || container || everything).to_html
  end

  private

  attr_accessor :document

  def main
    document.css('main')&.text&.strip
  end

  def container
    document.css('.container')&.text&.strip&.gsub('/t', '')
  end

  def everything
    document.text.strip
  end
end
