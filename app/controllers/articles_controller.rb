# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    @logs = @article.logs.order(created_at: :desc)
    @rankings = Article.chart(@article)
  end

  def new
    @article = current_user.articles.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      google = GoogleSearch.new(query: @article.keyword, url: @article.url, api_key: ENV["GOOGLE_API_KEY"], cse_id: ENV["GOOGLE_CSE_ID"])
      @article.rankings.create(ranking: google.fetch_ranking, ranked_on: Date.today)
      redirect_to @article, notice: t("success.article_was_successfully_created")
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      google = GoogleSearch.new(query: @article.keyword, url: @article.url, api_key: "mock_api_key", cse_id: "mock_cse_id")
      @article.rankings.create(ranking: google.fetch_ranking, ranked_on: Date.today)
      redirect_to @article, notice: t("success.article_was_successfully_updated")
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: t("success.article_was_successfully_destroyed")
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:url, :keyword)
    end
end
