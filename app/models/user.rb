# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :links, dependent: :destroy
end
