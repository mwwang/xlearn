namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(	firstname: 	"Mark",
									lastname: 	"Wang",
									email: 			"mwwang@gmail.com",
									password: 	"password",
									password_confirmation: 	"password")
		admin.toggle!(:admin)
		99.times do|n|
			firstname = Faker::Name.first_name
			lastname = Faker::Name.last_name
			# email = Faker::Internet.email
			email = "example-#{n+1}@example.com"
			password = "password"
			User.create!(	firstname: firstname,
										lastname: lastname,
										email: email,
										password: password,
										password_confirmation: password)
		end
		users = User.all(limit: 10)
		50.times do
			content = Faker::Lorem.sentence(5)
			users.each { |user| user.posts.create!(content: content) }
		end
	end
end