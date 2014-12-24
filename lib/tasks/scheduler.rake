# See https://devcenter.heroku.com/articles/scheduler

namespace :feed_simple do
  desc 'Load latest content from RSS feed (replaces previous content)'
  task :load => :environment do
    puts '----- load start -----'
    require 'open-uri'
    url = 'http://www.macleans.ca/multimedia/feed/'
    open(url) do |rss|
      Content.destroy_all
      Content.create(json: Hash.from_xml(rss).to_json)
    end
    puts '----- load done -----'
  end
end
