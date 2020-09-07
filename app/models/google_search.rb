# frozen_string_literal: true

# require 'google/apis/customsearch_v1'

API_KEY = 'AIzaSyBw0aq2C9Myj1eI2S53RQvYN-fKBgurP8I'
CSE_ID = '3d74cec29c9aa6d31'
Customsearch = Google::Apis::CustomsearchV1

class GoogleSearch
  def self.fetch_results
    searcher = Customsearch::CustomsearchService.new
    searcher.key = API_KEY

    query = "ハンターハンター"

    results = searcher.list_cses(q: query, cx: CSE_ID)
    items = results.items
    pp items.map { |item| { title: item.title, link: item.link } }
  end
end
