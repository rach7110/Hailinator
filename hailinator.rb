require "twitter"
require "csv"
# require "koala"  #started to install facebook gem, 'koala'

Twitter.configure do |config|
  config.consumer_key = "nLpqmlHLSERG1vJSXPs47Q"
  config.consumer_secret = "O8cqNAUAy5PhHcokQPKP1XO5wbFrJF9thZMEAnX7Qk"
  config.oauth_token = "18338282-rG1s7FFqHCAHPMVb8Co6PC3A5pegsXL8gd7nt8aa4"
  config.oauth_token_secret = "PDjKeSy3TIXZK84WIMHWvLN4DxDyJily7WT4Raw8Ng"
end



CSV.open("hail.csv", "wb") do |csv| #test with ab
  csv << ["handle", "text", "url"]
  Twitter.search("#GoSpursGo", :count => 1, :result_type => "recent").results.map do |status|
  csv << ["#{status.from_user}", "#{status.text}"]  
  # Twitter.follow(status.from_user) 
  # Twitter.favorite(status.id)

  # Koala. 
    
  end
end