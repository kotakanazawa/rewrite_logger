require "#{Rails.root}/config/environment"

desc "Create daily google rankings"
task :create_rankings do
  GoogleSearch.create_daily_rankings
end
