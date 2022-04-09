# frozen_string_literal: true

class Link < ApplicationRecord
  has_one :page, dependent: :destroy
  belongs_to :user

  validates :url, presence: true, url: true
  validates :url, uniqueness: { scope: :user_id }
  after_create_commit :create_page_job

  private

  def create_page_job
    PageJob.perform_later(self)
  end
end
