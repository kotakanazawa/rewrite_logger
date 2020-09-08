# frozen_string_literal: true

Customsearch = Google::Apis::CustomsearchV1

class GoogleSearch
  def initialize(query:, url:, api_key:, cse_id:)
    @query = query
    @url = url
    @api_key = api_key
    @cse_id = cse_id
  end

  def fetch_ranking
    rankings_ary.index(@url) + 1
  end

  def rankings_ary
    ary = []
    ary = search_results.map { |item| item.link }
  end

  private

    def search_results
      searcher = Customsearch::CustomsearchService.new
      searcher.key = @api_key
      @search_results = searcher.list_cses(q: @query, cx: @cse_id, start: 1).items
    end
end
