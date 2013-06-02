namespace :db do
  desc "Fill database with sample data"

  task populate: :environment do
    puts "Running db:populate in env: #{Rails.env}"

    admin = User.create!(name: "Example User",
                 email: "eggsample@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")

    admin.toggle!(:admin)

    2.times do |n|
      content = Faker::Lorem.sentence(5)
      admin.microposts.create!(content: content)
    end

    15.times do |n|
      name  = Faker::Name.name
      email = "eggsample-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
