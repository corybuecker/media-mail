# frozen_string_literal: true

require 'net/http'

class PageFetcher
  def self.fetch(url:)
    new(url).fetch
  end

  def initialize(url)
    self.url = url
  end

  def fetch
    uri = URI(url)

    Net::HTTP.get(uri)
  end

  private

  attr_accessor :url
end
