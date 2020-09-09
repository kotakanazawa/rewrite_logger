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

  def self.create_daily_rankings
    articles.each do |article|
      google = GoogleSearch.new(
        query: article.keyword,
        url: article.url,
        api_key: ENV["GOOGLE_API_KEY"],
        cse_id: ENV["GOOGLE_CSE_ID"]
      )
      article.rankings.create(ranking: google.fetch_ranking, ranked_on: Date.today)
    end
  end

  def has_ranking?(date)
    self.rankings.find_by(ranked_on: date)
  end

  def fetch_ranking(date)
    self.rankings.find_by(ranked_on: date).ranking
  end
end
