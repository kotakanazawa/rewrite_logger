desc "This task is called by the Heroku scheduler add-on."
task create_daily_rankings: :environment do
  puts "Creating daily google rankings..."
  GoogleSearch.create_daily_rankings
  puts "done."
end
