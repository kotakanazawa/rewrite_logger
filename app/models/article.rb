# frozen_string_literal: true

class Article < ApplicationRecord
  validates :url, presence: true
  validates :keyword, presence: true

  belongs_to :user
  has_many :rankings, dependent: :destroy
end

