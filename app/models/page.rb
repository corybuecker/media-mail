# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :link

  enum :processing_status, {
    unprocessed: 'unprocessed',
    fetched: 'fetched',
    parsed: 'parsed',
    sent: 'sent'
  }, default: :unprocessed

  validates :processing_status, presence: true

  after_update_commit :send_to_turbo_stream

  private

  def send_to_turbo_stream
    LinksChannel.broadcast_replace_later_to(link.user.identity, :links, target: link, partial: 'links/link',
                                                                        locals: { link:, page: self })
  end
end
