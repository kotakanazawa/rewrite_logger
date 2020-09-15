# frozen_string_literal: true

module ApplicationHelper
  def ranking_chart(rankings)
    line_chart rankings,
      min: 1,
      max: 50,
      curve: false,
      suffix: "位",
      discrete: true,
      library: library_options
  end

  private
    def library_options
      {
        scales: {
          xAxes: [{
            hAxis: { format: "MM/dd" }
          }],
          yAxes: [{
            ticks: { reverse: true }
          }]
        }
      }
    end
end
