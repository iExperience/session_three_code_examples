class Foo
	def foo
		puts "yup"
	end
end

class Bar
end

def print_foo(whatever)
	# foo#instance
	return whatever.foo if whatever.respond_to? :foo
	puts "didn't respond to foo"
end

print_foo(Foo.new)
print_foo(Bar.new)