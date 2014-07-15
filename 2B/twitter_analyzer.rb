### Twitter Analyzer

# 1. Ask the user for 3 tweets
# 2. Count the number of times a word is used
# 3. Print the word used the most

tweets = ["@nusco @camerondaigle Does this civilization have considerably larger seat dimensions for their space planes?  If no, then I can't agree. ;)",
"Early on, even great user interfaces suck wp.me/p4LE2l-12",
"What, Atom doesn't have alt+drag to do multi-line cursors? oO"]

words = tweets.map do |tweet|
    # creates an array of words
	tweet.split
	# implicit return to map
end.flatten

word_count = Hash.new { 0 }

words.each do |word|
	word_count[word] += 1
end

most_frequent = ""
max_frequency = 0
word_count.each do |key, value|
	if max_frequency < word_count[key]
		max_frequency = word_count[key]
		most_frequent = key
	end
end

puts most_frequent
