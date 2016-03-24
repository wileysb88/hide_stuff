require 'bundler'
Bundler.require

Dotenv.load


puts Rainbow(ENV).cyan.blink
puts Rainbow(ENV["API_KEY"]).magenta.underline
puts Rainbow(ENV["VERSION"]).green.italic
puts Rainbow(ENV["APP_NAME"]).yellow.inverse

def show_secrets
  p ENV.length.to_s + " is the length of ENV"
  ENV.each do |secret|
    puts Rainbow(secret).aqua.inverse
  end
end

show_secrets

def get_movie
  p HTTParty.get('http://www.omdbapi.com/' + ENV["MOVIE"])
end

get_movie
