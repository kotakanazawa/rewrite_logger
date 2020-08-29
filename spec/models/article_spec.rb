require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user_a) { FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com") }
  let!(:article_a) { FactoryBot.create(:article, url: "test_url", keyword: "テストキーワード", user: user_a) }

  before do
    @article = Article.create(
      url: "test_url",
      keyword: "test_keyword",
      user: user_a
    )
    @article.rankings.create(
      ranked_on: 20200818,
      ranking: 1
    )
  end

  describe "記事の登録" do
    context "urlとkeywordを入力するとき" do
      it "記事を登録できる" do
        expect(@article).to be_valid
      end
    end

    context "url、keywordどちらかがないとき" do
      it "urlがnilなら登録できない" do
        article = Article.new(
          url: nil,
          keyword: "test_keyword",
          user: user_a
        )
        expect(article).not_to be_valid
      end

      it "keywordがnilなら登録できない" do
        article = Article.new(
          url: "test_url",
          keyword: nil,
          user: user_a
        )
        expect(article).not_to be_valid
      end
    end
  end

  it "#has_ranking" do
    expect(@article.has_ranking?(20200818)).to be_truthy
  end

  it "#fetch_ranking" do
    expect(@article.fetch_ranking(20200818)).to eq 1
  end
end
