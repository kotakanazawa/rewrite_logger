# frozen_string_literal: true

require "rails_helper"

RSpec.describe Log, type: :model do
  let(:user_a) { FactoryBot.create(:user) }
  let!(:article_a) { FactoryBot.create(:article, user: user_a) }
  let!(:log_a) { FactoryBot.create(:log, article: article_a) }

  describe "ログの登録" do
    context "ログタイトルと詳細を登録するとき" do
      it "ログを登録できる" do
        expect(log_a).to be_valid
      end
    end

    context "ログタイトルと詳細どちらかが存在しないとき" do
      it "タイトルがnilなら登録できない" do
        log = FactoryBot.build(:log, title: nil, article: article_a)
        expect(log).not_to be_valid
      end

      it "詳細がnilなら登録できない" do
        log = FactoryBot.build(:log, description: nil, article: article_a)
        expect(log).not_to be_valid
      end
    end
  end
end
