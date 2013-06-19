require "twitter"
require "csv"

Twitter.configure do |config|
  config.consumer_key = "utPDH8BWHvZwrsaSbqM1Q"
  config.consumer_secret = "0ocFufU1qB3tTMIRasG7EpLLlTsedncJ9f8GESPQg4"
  config.oauth_token = "18338282-mahYki2gshIYSqhapADB3jSvK4R7fGm3iR88HdGvy"
  config.oauth_token_secret = "bveLpx0S3pOu5RdYmtklqQJT5HDxDSmyMinJqW5IHM8"
end

Twitter.search("#haildamage", :count => 3, :result_type => "recent").results.map do |status|
	puts "#{status.from_user}: #{status.text}"
	@csv_handle = status.from_user
	@csv_text = status.text
end



CSV.open("hail.csv", "wb") do |csv| #why a loop for the header? what is wb?
  csv << ["handle", "text", "url"]
  csv << ["#{@csv_handle}", "#{@csv_text}"]
end