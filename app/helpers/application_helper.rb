# frozen_string_literal: true

module ApplicationHelper
  def dates
    dates = []
    first_day_of_month = Time.current.beginning_of_month.to_date
    last_day_of_month = Time.current.end_of_month.to_date
    (first_day_of_month..@last_day_of_month).each do |date|
      dates << date
    end
  end
end
