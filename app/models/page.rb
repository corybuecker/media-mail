# frozen_string_literal: true

# migration
class Page < ApplicationRecord
  belongs_to :link

  enum :processing_status, {
    unprocessed: 'unprocessed',
    fetched: 'fetched',
    parsed: 'parsed',
    sent: 'sent'
  }, default: :unprocessed

  validates :processing_status, presence: true
end
