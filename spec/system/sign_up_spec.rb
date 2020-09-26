# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ユーザー認証", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    user.confirm
  end

  describe "認証" do
    it "正常にサインインできる" do
      visit new_user_session_path
      fill_in "メールアドレス",	with: user.email
      fill_in "パスワード",	with: user.password
      click_button "ログイン"
      expect(current_path).to eq root_path
      expect(page).to have_content "ログインしました。"
    end

    it "正常にログアウトできる" do
      user.confirm
      visit new_user_session_path
      fill_in "メールアドレス",	with: user.email
      fill_in "パスワード",	with: user.password
      click_button "ログイン"

      visit edit_user_registration_path
      page.accept_confirm do
        click_link "ログアウト"
      end
      expect(page).to have_content "ログアウトしました。"
    end
  end
end
