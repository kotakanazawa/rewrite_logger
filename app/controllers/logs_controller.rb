class LogsController < ApplicationController
  def new
  end

  def show
    @log = Log.find(params[:id])
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
