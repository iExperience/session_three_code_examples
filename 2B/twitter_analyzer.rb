### Twitter Analyzer

# 1. Ask the user for 3 tweets
# 2. Count the number of times a word is used
# 3. Print the word used the most

loop do
  puts "Please enter three tweets:"

  tweets = []
  3.times do
    tweets << gets.strip
  end

  words = tweets.map do |tweet|
    # creates an array of words
    tweet.split
    # implicit return to map
  end.flatten

  word_count = Hash.new { 0 }

  words.each do |word|
    # word = "@nusco"
    word_count[word] += 1
  end

  most_frequent = ""
    max_frequency = 0
    word_count.each do |word, value|
    if max_frequency < word_count[word]
        max_frequency = word_count[word]
        most_frequent = word
    end
  end

  puts "Most used word: #{most_frequent} -- used #{max_frequency} times"

  puts "Want to do it again? (Y/N)"

  break unless gets.strip.downcase == "y"
end