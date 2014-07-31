namespace :db do
  desc "Populate the database with data"
  task populate: "db:setup" do
    20.times do
      user = User.create do |u|
        u.email = Faker::Internet.email
        u.handle = Faker::Internet.user_name
        u.password = "password"
        u.password_confirmation = "password"
      end

      100.times do
        user.tweets.create do |t|
          t.content = Faker::Lorem.sentence
        end
      end
    end
  end  
end