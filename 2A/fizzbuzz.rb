1.upto(100) do |number|
	# if the number is divisible by 3 "Fizz"
	# if the number is divisible by 5 "Buzz"
	# otherwise we are gonna print the number

    ## First attempt

	# if number % 3 == 0 && number % 5 == 0
	# 	puts "FizzBuzz"
	# elsif number % 5 == 0
	# 	puts "Buzz"
	# elsif number % 3 == 0 
	# 	puts "Fizz"
	# else
	# 	puts number
	# end

	## Second attempt, possibly more maintainable
	# fizzbuzz = ""

	# if number % 3 == 0
	# 	# fizzbuzz = fizzbuzz + "Fizz"
	# 	fizzbuzz += "Fizz"
	# end

	# if number % 5 == 0
	# 	fizzbuzz += "Buzz"
	# end

	# if fizzbuzz == ""
	# 	fizzbuzz += "#{number}"
	# end

	fizzbuzz = ""

	fizzbuzz += "Fizz" if number % 3 == 0
	fizzbuzz += "Buzz" if number % 5 == 0
	fizzbuzz += "#{number}" if fizzbuzz.empty?

	puts fizzbuzz

	## Advanced Example

	# class FizzBuzz

	# 	attr_accessor :number

	# 	def initialize(number)
	# 		@number = number
	# 	end

	# 	def divisible_by_three?
	# 		number % 3 == 0
	# 	end

	# 	def divisible_by_five?
	# 		number % 5 == 0
	# 	end

	# 	def to_s
	# 		result = ""
	# 		result += "Fizz" if divisible_by_three?
	# 		result += "Buzz" if divisible_by_five?
	# 		result.empty? ? "#{number}" : result
	# 	end
	# end

	# fizzbuzz = FizzBuzz.new(number)

	# puts fizzbuzz

end