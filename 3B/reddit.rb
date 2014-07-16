require 'rest_client'
require 'json'
require 'pry'

puts "Please enter a subreddit"

subreddit = gets.strip


begin
  response = RestClient.get("http://www.reddit.com/r/#{subreddit}.json?limit=10")
rescue RestClient::ResourceNotFound => exception
  puts exception.message
  puts "Sorry, that subreddit does not exist."
rescue Exception => exception
	puts "I DON'T KNOW WHAT HAPPENED????"
end

json = nil
json = JSON.parse(response) if response # != nil

puts json

# DO YOUR THING