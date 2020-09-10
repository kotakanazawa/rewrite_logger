require "#{Rails.root}/config/environment"

namespace :scheduler do
  desc "Heroku scheduler add-on."
  task :fetch_daily_rankings do
    puts "Fetching daily google rankings..."
    GoogleSearch.fetch_daily_rankings
    puts "done."
  end
end
