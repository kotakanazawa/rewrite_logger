# frozen_string_literal: true

require "rails_helper"

# WebMock.allow_net_connect!

RSpec.describe Google, type: :model do
  # let(:user_a) { FactoryBot.create(:user) }
  # let!(:article_a) { FactoryBot.create(:article, user: user_a) }
  # let!(:log_a) { FactoryBot.create(:log, article: article_a) }

  it ".fetch" do
    GoogleSearch.fetch_results
  end
end
