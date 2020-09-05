# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ログ管理", type: :system do
  let(:user_a) { FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com") }
  let!(:article_a) { FactoryBot.create(:article, user: user_a) }
  let!(:log_a) { FactoryBot.create(:log, title: "テストログ1", description: "テストログ詳細1", article: article_a) }
  let!(:log_b) { FactoryBot.create(:log, title: "テストログ2", description: "テストログ詳細2", article: article_a) }

  before do
    visit user_session_path
    fill_in "メールアドレス",	with: login_user.email
    fill_in "パスワード",	with: login_user.password
    click_button "ログイン"
  end

  describe "ログ一覧" do
    context "ユーザーAがログインしているとき" do
      let(:login_user) { user_a }

      before do
        visit article_path(article_a)
      end

      it "ユーザーAが作成したログタイトルが表示される" do
        expect(page).to have_content "テストログ1"
        expect(page).to have_content "テストログ2"
      end
    end
  end

  describe "ログ詳細" do
    context "ユーザーAがログインしているとき" do
      let(:login_user) { user_a }

      before do
        visit article_path(article_a)
        click_link "テストログ1"
      end

      it "ログの詳細が表示される" do
        expect(page).to have_content "テストログ1"
        expect(page).to have_content "テストログ詳細1"
      end
    end
  end

  describe "ログ作成" do
      let(:login_user) { user_a }

      before do
        visit article_path(article_a)
        click_link "ログを作成する"
        fill_in "タイトル", with: log_title
        fill_in "変更内容", with: log_description
        click_button "登録する"
      end

      context "新規作成画面でタイトルと変更内容を入力したとき" do
        let(:log_title) { "新規ログタイトル" }
        let(:log_description) { "新規ログ変更内容" }

        it "正常に登録される" do
          expect(page).to have_content "新規ログタイトル"
          expect(page).to have_content "新規ログ変更内容"
        end
      end

      context "新規作成画面でURLとキーワードを入力しなかったとき" do
        let(:log_title) { "" }
        let(:log_description) { "" }

        it "エラーとなる" do
          within "#error_explanation" do
            expect(page).to have_content "タイトルを入力してください"
            expect(page).to have_content "変更内容を入力してください"
          end
        end
      end
    end

  describe "ログ編集" do
    let(:login_user) { user_a }

    before do
      visit article_path(article_a)
      click_link "テストログ1"
      click_link "編集"
      fill_in "タイトル", with: "ログタイトル編集済み"
      fill_in "変更内容", with: "ログ変更内容編集済み"
      click_button "更新する"
    end

    it "ログを編集できる" do
      expect(page).to have_content "ログタイトル編集済み"
      expect(page).to have_content "ログ変更内容編集済み"
    end
  end

  describe "ログ削除" do
    let(:login_user) { user_a }

    before do
      visit article_path(article_a)
      click_link "テストログ1"
    end

    it "正常に削除できる" do
      page.accept_confirm do
        click_link "削除"
      end
      expect(page).to have_content "ログを削除しました"
    end
  end
end
