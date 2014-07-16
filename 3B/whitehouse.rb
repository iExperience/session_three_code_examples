# whitehouse.gov
# ask type for petitions
# ask for number of petitions
# print the title of the first n petitions

require 'rest_client'
require 'json'

loop do
  
  puts "What type of petition do you want?"

  type = gets.strip

  puts "How many petitions do you want?"

  number = gets.strip

  url = "http://api.whitehouse.gov/v1/petitions.json"

  # returns text
  response = RestClient.get url, :params => {:limit => number, :status => type}

  json_hash = JSON.parse(response)

  json_hash["results"].each_with_index do |result, index|
    puts "#{index}: #{result["title"]}"
  end

  puts "Again? (Y/N)"

  break unless gets.strip.downcase == "y"
  
end