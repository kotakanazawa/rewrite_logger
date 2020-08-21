json.extract! article, :id, :title, :url, :keyword, :created_at, :updated_at
json.url article_url(article, format: :json)
