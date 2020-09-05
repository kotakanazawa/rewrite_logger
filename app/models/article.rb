# frozen_string_literal: true

class Article < ApplicationRecord
  validates :url, presence: true
  validates :keyword, presence: true

  belongs_to :user
  has_many :rankings, dependent: :destroy
  has_many :logs, dependent: :destroy

  def self.chart(article)
    hash = Hash.new(0)
    article.rankings.each do |ranking|
      hash[ranking.ranked_on.to_s] = ranking.ranking
    end
    hash
  end

  def has_ranking?(date)
    self.rankings.find_by(ranked_on: date)
  end

  def fetch_ranking(date)
    self.rankings.find_by(ranked_on: date).ranking
  end
end
