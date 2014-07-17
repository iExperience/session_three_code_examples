require 'rest-client'
require 'json'

require_relative 'story'
require_relative 'petition'
require_relative 'reddit'

puts "Welcome to Stories!"

while true

  puts "What kind of stories would you like to see?"
  puts "1. Open Petitions"
  puts "2. Top Reddit Stories"

  choice = gets.strip

  stories = []

  if choice == "1"
    url = "https://api.whitehouse.gov/v1/petitions.json?limit=10&status=open"
  elsif choice == "2"
    url = "http://www.reddit.com/top.json?limit=10"
  end

  response = RestClient.get(url)
  parsed_response = JSON.parse(response)

  choices = {"1" => {:klass => Reddit, :results => lambda {parsed_response["results"]}},
             "2" => {:klass => Petition, :results => lambda {parsed_response["data"]["children"]}}}
             
  decision = choices.fetch(choice)
  results = decision.fetch(:results).call
  story_klass = decision.fetch(:klass)

  results.each do |story|
    # story is a hash
    stories << story_klass.new(story)
  end

  # print out ANY stories
  stories.each_with_index do |story, index|
    puts "#{index+1}. #{story}"
  end

  puts "Would you like to see more stories? (Y/N)"

  break unless gets.strip.downcase == "y"
end