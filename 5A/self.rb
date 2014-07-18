class Person

  attr_reader :name

  def nickname=(name)
    @name = name
  end

  def initialize(name)
    # name = name # creates a variable called name in the init method
    self.nickname = name
  end

  def self.species
    "Human"
  end

  # say "Micah is a Human"
  def say_name_and_species
    puts "#{name} is a #{self.class.species}"
  end
end

class Mutant < Person
  def self.species
    "Mutant"
  end
end