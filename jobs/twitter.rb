require 'twitter'

Twitter.configure do |config|
  #Berechtigungen: read-only.
  config.consumer_key = 'XvzGSGPT6RNz3nNjLActIDRaV'
  config.consumer_secret = 'DI6C3HHbPgPUGMJO9i4dgKXBQmuuUlr87cOuKsn9Ivg4MMVd8R'
  config.oauth_token = '91400607-qt4ZciqjUzPzIXcOe3EHZ9nT2Mh37FWykpKCJSfKF'
  config.oauth_token_secret = '3tbyiUeMEEU8cgRLA4xi22W3Oj8ui6L25eVgyb9m0WMXu'
end

search_term = URI::encode('#bge')

SCHEDULER.every '10m', :first_in => 0 do |job|
  tweets = Twitter.search("#{search_term}").results
  if tweets
    tweets.map! do |tweet|
      { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
    end
    send_event('twitter_mentions', comments: tweets)
  end
end
