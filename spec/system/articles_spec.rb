# frozen_string_literal: true

require "rails_helper"

RSpec.describe "記事管理", type: :system do
  let(:user_a) { FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com") }
  let(:user_b) { FactoryBot.create(:user, name: "ユーザーB", email: "b@example.com") }
  let!(:article_a) { FactoryBot.create(:article, user: user_a) }
  let!(:ranking_a) { FactoryBot.create(:ranking, article: article_a) }

  before do
    visit user_session_path
    fill_in "メールアドレス",	with: login_user.email
    fill_in "パスワード",	with: login_user.password
    click_button "ログイン"

    stub_google!
    @google_search = GoogleSearch.new(
      query: "ハンターハンター",
      url: "https://ja.wikipedia.org/wiki/HUNTER%C3%97HUNTER",
      api_key: "mock_api_key",
      cse_id: "mock_cse_id"
    )
  end

  describe "記事一覧" do
    context "ユーザーAがログインしているとき" do
      let(:login_user) { user_a }

      it "ユーザーAが作成したキーワードが表示される" do
        expect(page).to have_content "テストキーワード"
      end
    end

    context "ユーザーBがログインしているとき" do
      let(:login_user) { user_b }

      it "ユーザーAが登録した記事が表示されない" do
        expect(page).to have_no_content "テストキーワード"
      end
    end
  end

  describe "記事詳細" do
    context "ユーザーAがログインしているとき" do
      let(:login_user) { user_a }

      before do
        visit article_path(article_a)
      end

      it "ユーザーAが作成したキーワードが表示される" do
        expect(page).to have_content "test_url"
        expect(page).to have_content "テストキーワード"
      end
    end
  end

  describe "記事作成" do
    let(:login_user) { user_a }
    before do
      visit new_article_path
      fill_in "URL", with: article_url
      fill_in "キーワード", with: article_keyword
      click_button "登録"
    end

    context "新規作成画面でURLとキーワードを入力したとき" do
      let(:article_url) { "https://ja.wikipedia.org/wiki/HUNTER%C3%97HUNTER" }
      let(:article_keyword) { "ハンターハンター" }

      it "正常に登録される" do
        expect(page).to have_content "https://ja.wikipedia.org/wiki/HUNTER%C3%97HUNTER"
        expect(page).to have_content "ハンターハンター"
      end
    end

    context "新規作成画面でURLとキーワードを入力しなかったとき" do
      let(:article_url) { "" }
      let(:article_keyword) { "" }

      it "エラーとなる" do
        expect(page).to have_content "URLを入力してください"
        expect(page).to have_content "キーワードを入力してください"
      end
    end
  end

  describe "記事詳細" do
    let(:login_user) { user_a }

    it "検索順位が表示される" do
      expect(page).to have_content "検索順位"
    end
  end
end
