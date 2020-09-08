# frozen_string_literal: true

require "rails_helper"

RSpec.describe Google, type: :model do
  before do
    stub_google!
    @google_search = GoogleSearch.new(
      query: "ハンターハンター",
      url: "https://ja.wikipedia.org/wiki/HUNTER%C3%97HUNTER",
      api_key: "mock_api_key",
      cse_id: "mock_cse_id"
    )
  end

  describe "#fetch_ranking" do
    it "キーワードの順位が1位である" do
      expect(@google_search.fetch_ranking).to eq 1
    end
  end
end
