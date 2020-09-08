# frozen_string_literal: true

module StubHelper
  def stub_google!
    stub_google_1_to_10!
    stub_google_11_to_20!
    stub_google_21_to_30!
    stub_google_31_to_40!
    stub_google_41_to_50!
  end

  def stub_google_1_to_10!
    json = File.read("#{Rails.root}/spec/factories/files/mock_bodies/search_results_1.json")
    stub_request(:get, "https://customsearch.googleapis.com/customsearch/v1?cx=mock_cse_id&key=mock_api_key&q=%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC&start=1").to_return(status: 200, body: json, headers: { "Content-Type" =>  "application/json" })
  end

  def stub_google_11_to_20!
    json = File.read("#{Rails.root}/spec/factories/files/mock_bodies/search_results_2.json")
    stub_request(:get, "https://customsearch.googleapis.com/customsearch/v1?cx=mock_cse_id&key=mock_api_key&q=%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC&start=11").to_return(status: 200, body: json, headers: { "Content-Type" =>  "application/json" })
  end

  def stub_google_21_to_30!
    json = File.read("#{Rails.root}/spec/factories/files/mock_bodies/search_results_3.json")
    stub_request(:get, "https://customsearch.googleapis.com/customsearch/v1?cx=mock_cse_id&key=mock_api_key&q=%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC&start=21").to_return(status: 200, body: json, headers: { "Content-Type" =>  "application/json" })
  end

  def stub_google_31_to_40!
    json = File.read("#{Rails.root}/spec/factories/files/mock_bodies/search_results_4.json")
    stub_request(:get, "https://customsearch.googleapis.com/customsearch/v1?cx=mock_cse_id&key=mock_api_key&q=%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC&start=31").to_return(status: 200, body: json, headers: { "Content-Type" =>  "application/json" })
  end

  def stub_google_41_to_50!
    json = File.read("#{Rails.root}/spec/factories/files/mock_bodies/search_results_5.json")
    stub_request(:get, "https://customsearch.googleapis.com/customsearch/v1?cx=mock_cse_id&key=mock_api_key&q=%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC&start=41").to_return(status: 200, body: json, headers: { "Content-Type" =>  "application/json" })
  end
end
