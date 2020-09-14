# frozen_string_literal: true

class Article < ApplicationRecord
  validates :url, presence: true, format: /\A#{URI.regexp(%w(http https))}\z/
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

  def show_ranking(date)
    ranking = self.rankings.find_by(ranked_on: date).ranking
    if ranking == 51
      "圏外"
    else
      ranking
    end
  end
end
