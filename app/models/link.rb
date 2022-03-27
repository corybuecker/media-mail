# frozen_string_literal: true

class Link < ApplicationRecord
  has_one :page, dependent: :destroy

  validates :url, presence: true, uniqueness: true, url: true

  after_create_commit :create_page_job

  private

  def create_page_job
    PageJob.perform_later(self)
  end
end
