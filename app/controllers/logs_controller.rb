class LogsController < ApplicationController
  before_action :set_article, only: [:new, :create]

  def new
    @log = Log.new
  end

  def show
    @log = Log.find(params[:id])
  end

  def create
    @log = @article.logs.new(log_params)

    if @log.save
      redirect_to @log
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def log_params
      params.require(:log).permit(:title, :description)
    end

    def set_article
      @article = current_user.articles.find(params[:article_id])
    end
end
