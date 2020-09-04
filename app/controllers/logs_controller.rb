class LogsController < ApplicationController
  before_action :set_log, only: %i(show edit update destroy)
  before_action :set_article, only: %i(new create update)

  def new
    @log = Log.new
  end

  def show
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
    if @log.update(log_params)
      redirect_to @log, notice: 'Log was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @log.destroy
    redirect_to article_path(@log.article_id), notice: 'Log was successfully destroyed.'
  end

  private

    def log_params
      params.require(:log).permit(:title, :description)
    end

    def set_log
      @log = Log.find(params[:id])
    end

    def set_article
      @article = current_user.articles.find(params[:article_id])
    end
end
