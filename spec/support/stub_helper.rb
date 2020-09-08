module StubHelper
  def stub_google!
    json = File.read("#{Rails.root}/spec/factories/files/mock_bodies/search_results.json")
    stub_request(:get, "https://customsearch.googleapis.com/customsearch/v1?cx=mock_cse_id&key=mock_api_key&q=%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%8F%E3%83%B3%E3%82%BF%E3%83%BC&start=1").to_return(status: 200, body: json, headers: { "Content-Type" =>  "application/json" })
  end
end
