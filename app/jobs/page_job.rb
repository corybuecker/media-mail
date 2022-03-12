# frozen_string_literal: true

class PageJob < ApplicationJob
  def perform(link)
    page = Page.find_or_create_by(link_id: link.id)

    raw = PageFetcher.fetch(url: link.url)
    page.update!(raw:, processing_status: :fetched)

    parsed = ContentParser.parse(contents: raw)
    title = TitleParser.parse(contents: raw)

    page.update!(parsed:, processing_status: :parsed, title:)
  end
end
