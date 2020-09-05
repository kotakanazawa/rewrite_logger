# frozen_string_literal: true

class Log < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :article
end
