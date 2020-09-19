# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      @articles = current_user.articles
      @today = Date.current.prev_day
      @start_date = Date.current.ago(14.days).to_date
    else
      render "welcome/index"
    end
  end
end
