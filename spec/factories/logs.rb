FactoryBot.define do
  factory :log do
    title { "テストログ" }
    description { "テストログ詳細" }
    article
  end
end
