# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :user

  validates :url, presence: true, url: true
  validates :url, uniqueness: { scope: :user_id }
end
