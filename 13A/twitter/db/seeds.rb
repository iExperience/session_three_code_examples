# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.where(email: "micah@ixperience.co.za").first_or_create do |user|
  user.handle = "micah"
  user.password = "password"
  user.password_confirmation = "password"
  user.role = :admin
end

# [:admin, :supervisor, :user].each do |role|
#   Role.where(name: role).first_or_create
# end