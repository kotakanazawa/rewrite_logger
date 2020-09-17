# frozen_string_literal: true

today = Date.current.to_date
start_day = today.ago(3.months).to_date
rankings = [*(1..50)]

if User.find_by(name: "test-user")
  User.find_by(name: "test-user").destroy
end

user = User.create!(name: "test-user", email: "testtest@example.com", password: "testtest")

article_1 = user.articles.create(url: "https://test-fjord-hyoban.com", keyword: "フィヨルドブートキャンプ 評判")
article_2 = user.articles.create(url: "https://test-hunter-hunter.com", keyword: "ハンターハンター 連載再開 いつ")
article_3 = user.articles.create(url: "https://test-protein-osusume.com", keyword: "プロテイン おすすめ")

(start_day..today).each do |day|
  article_1.rankings.create(ranking: rankings.sample, ranked_on: day)
  article_2.rankings.create(ranking: rankings.sample, ranked_on: day)
  article_3.rankings.create(ranking: rankings.sample, ranked_on: day)
end

6.times do
  article_1.logs.create(title: "テストログです", description: "テストログの詳細です", created_at: Random.rand(start_day..today))
  article_2.logs.create(title: "テストログです", description: "テストログの詳細です", created_at: Random.rand(start_day..today))
  article_3.logs.create(title: "テストログです", description: "テストログの詳細です", created_at: Random.rand(start_day..today))
end
