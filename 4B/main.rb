require 'rest-client'
require 'json'

require_relative 'petition_choice'
require_relative 'reddit_choice'

puts "Welcome to Stories!"

loop do

  puts "What kind of stories would you like to see?"
  puts "1. Open Petitions"
  puts "2. Top Reddit Stories"

  choice = gets.strip

  choices = {"1" => PetitionChoice,
             "2" => RedditChoice}

  decision = choices[choice].new

  stories = decision.stories

  stories.each_with_index do |story, index|
    puts "#{index+1}. #{story}"
  end

  puts "Would you like to see more stories? (Y/N)"

  break unless gets.strip.downcase == "y"
end
