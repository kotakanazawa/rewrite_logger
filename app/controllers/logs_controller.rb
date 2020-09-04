class LogsController < ApplicationController
  before_action :set_article, only: [:new, :update, :create]

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
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])

    if @log.update(log_params)
      redirect_to @log, notice: 'Log was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    redirect_to article_path(@log.article_id), notice: 'Log was successfully destroyed.'
  end

  private

    def log_params
      params.require(:log).permit(:title, :description)
    end

    def set_article
      @article = current_user.articles.find(params[:article_id])
    end
end
