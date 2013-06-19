require "twitter"
require "csv"

Twitter.configure do |config|
  config.consumer_key = "utPDH8BWHvZwrsaSbqM1Q"
  config.consumer_secret = "0ocFufU1qB3tTMIRasG7EpLLlTsedncJ9f8GESPQg4"
  config.oauth_token = "18338282-mahYki2gshIYSqhapADB3jSvK4R7fGm3iR88HdGvy"
  config.oauth_token_secret = "bveLpx0S3pOu5RdYmtklqQJT5HDxDSmyMinJqW5IHM8"
end



CSV.open("hail.csv", "wb") do |csv| #test with ab
  csv << ["handle", "text", "url"]
  Twitter.search("#haildamage", :count => 30, :result_type => "recent").results.map do |status|
  csv << ["#{status.from_user}", "#{status.text}"]
  end
end