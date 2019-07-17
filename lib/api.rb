 # ligne très importante qui appelle la gem.
 require 'twitter'
  require 'dotenv'

 # n'oublie pas les lignes pour Dotenv ici…
 Dotenv.load('../.env') #important car on ne peut pas executer le fichier ruby car le fichier.env n'est pas dans le lib
 
 # ligne qui permet de tweeter sur ton compte

  # quelques lignes qui appellent les clés d'API de ton fichier .env
def login_twitter
 client = Twitter::REST::Client.new do |config|#
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  return client
end
def twitter_login_stream
  client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  return client
end

client = login_twitter 
client_str = twitter_login_stream 

client.update('Mon premier tweet automatisé!!!!')

