# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    url { "https://test_url.com" }
    keyword { "テストキーワード" }
    user
  end
end
