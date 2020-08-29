# frozen_string_literal: true

FactoryBot.define do
  factory :ranking do
    ranking { 1 }
    ranked_on { 20200820 }
    article
  end
end
