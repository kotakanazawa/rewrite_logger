# frozen_string_literal: true

require "rails_helper"

RSpec.describe Article, type: :model do
  let(:user_a) { FactoryBot.create(:user) }
  let!(:article_a) { FactoryBot.create(:article, url: "test_url", keyword: "テストキーワード", user: user_a) }
  let!(:ranking_a) { FactoryBot.create(:ranking, article: article_a) }
  let!(:ranking_b) { FactoryBot.create(:ranking, ranking: 2, ranked_on: 20200819, article: article_a) }

  describe "記事の登録" do
    context "urlとkeywordを入力するとき" do
      it "記事を登録できる" do
        expect(article_a).to be_valid
      end
    end

    context "url、keywordどちらかがないとき" do
      it "urlがnilなら登録できない" do
        article = FactoryBot.build(:article, url: nil, keyword: "テストキーワード", user: user_a)
        expect(article).not_to be_valid
      end

      it "keywordがnilなら登録できない" do
        article = FactoryBot.build(:article, url: "test_url", keyword: nil, user: user_a)
        expect(article).not_to be_valid
      end
    end
  end

  describe "#.chart" do
    it "記事の検索順位と記録日がハッシュで返る" do
      expect(Article.chart(article_a)).to eq(
        {
          "2020-08-20" => 1,
          "2020-08-19" => 2
        })
    end
  end

  it "#has_ranking" do
    expect(article_a.has_ranking?(20200820)).to be_truthy
  end

  it "#fetch_ranking" do
    expect(article_a.fetch_ranking(20200820)).to eq 1
  end
end
