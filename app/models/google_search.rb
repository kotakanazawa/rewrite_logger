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
    if ranked_in?
      google_rankings.index(@url) + 1
    else
      51
    end
  end

  private

    def ranked_in?
      google_rankings.any? { |result_url| @url.include?(result_url) }
    end

    def google_rankings
      searcher = Customsearch::CustomsearchService.new
      searcher.key = @api_key

      google_rankings = []
      start_index = 1

      4.times do
        search_results = searcher.list_cses(q: @query, cx: @cse_id, start: start_index).items
        ranking_ary = search_results.map { |item| item.link }
        google_rankings << ranking_ary
        start_index += 10
      end
      google_rankings.flatten
    end
end
