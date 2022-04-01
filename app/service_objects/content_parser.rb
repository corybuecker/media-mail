# frozen_string_literal: true

require 'net/http'

class ContentParser
  def self.parse(contents:)
    new(contents).parse
  end

  def initialize(contents)
    self.contents = contents
  end

  def parse
    Net::HTTP.post(URI.parse(Rails.application.credentials.readability), contents).body
  end

  private

  attr_accessor :contents
end
