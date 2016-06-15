require 'twitter'


#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = 'XvzGSGPT6RNz3nNjLActIDRaV'
  config.consumer_secret = 'DI6C3HHbPgPUGMJO9i4dgKXBQmuuUlr87cOuKsn9Ivg4MMVd8R'
  config.access_token = '91400607-qt4ZciqjUzPzIXcOe3EHZ9nT2Mh37FWykpKCJSfKF'
  config.access_token_secret = '91400607-qt4ZciqjUzPzIXcOe3EHZ9nT2Mh37FWykpKCJSfKF'
end

search_term = URI::encode('from:socialmeera')

SCHEDULER.every '2s', :first_in => 0 do |job|
  begin
    tweets = twitter.search("#{search_term}")

    if tweets
      tweets = tweets.map do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end