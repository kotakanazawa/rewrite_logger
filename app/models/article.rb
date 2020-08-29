# frozen_string_literal: true

class Article < ApplicationRecord
  validates :url, presence: true
  validates :keyword, presence: true

  belongs_to :user
  has_many :rankings, dependent: :destroy

  def has_ranking?(date)
    self.rankings.find_by(ranked_on: date)
  end

  def fetch_ranking(date)
    self.rankings.find_by(ranked_on: date).ranking
  end
end
