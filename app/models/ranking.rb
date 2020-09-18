# frozen_string_literal: true

class Ranking < ApplicationRecord
  validates :ranking, presence: true
  validates :ranked_on, presence: true
  belongs_to :article
end
