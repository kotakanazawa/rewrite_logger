# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ユーザー登録", type: :system do
  before do
    ActionMailer::Base.deliveries.clear
  end

  it "メール認証で登録できる" do
    visit new_user_registration_path
    fill_in "メールアドレス",	with: "sign_up_tester@example.com"
    fill_in "パスワード",	with: "testtest"
    fill_in "パスワード（確認用）",	with: "testtest"
    expect { click_button "アカウント登録" }.to change { ActionMailer::Base.deliveries.size}.by(1)
    expect(page).to have_content "本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。"

    mail = ActionMailer::Base.deliveries.last
    body = mail.body.encoded
    puts confirmation_url = body[/http[^"]+/]
    visit user_session_path
    expect(page).to have_content "メールアドレスが確認できました。"
    fill_in "メールアドレス",	with: "sign_up_tester@example.com"
    fill_in "パスワード",	with: "testtest"
    click_button "ログイン"
  end
end
