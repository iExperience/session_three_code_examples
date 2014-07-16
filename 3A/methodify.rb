# Make this better

def school_acronym(school_name)
  # returns "LSU"
  school_name.split.map{|word| word[0]}.join
end

def school_cheer(school_name)
  "#{school_acronym(school_name)} FTW!"
end

loop do # same as `while true`
  puts "Please enter your school:"

  school = gets.strip

  puts school_cheer(school)

  puts "Again? (Y/N)"

  break unless gets.strip.downcase == "y"
end
