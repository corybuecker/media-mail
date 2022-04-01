# frozen_string_literal: true

class PageJob < ApplicationJob
  queue_as :default
  discard_on StandardError

  def perform(link)
    page = Page.find_or_create_by(link_id: link.id)

    raw = PageFetcher.fetch(url: link.url)
    page.update!(raw:, processing_status: :fetched)

    title = TitleParser.parse(contents: raw)
    page.update!(title:)

    parsed = ContentParser.parse(contents: raw)

    page.update!(parsed:, processing_status: :parsed, title:)

    NewsletterMailer.with(contents: page.parsed, title: page.title).page.deliver_later
  end
end
