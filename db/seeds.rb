# Create Users
15.times do
	user = User.find_or_initialize_by(username: Faker::LordOfTheRings.character, email: Faker::Internet.safe_email) do |user|
		user.password = Faker::Internet.password
	end
	user.skip_confirmation!
	user.save!
end

# Create Admin User

# Create Standard User
standard = User.find_or_initialize_by(username: 'standard', email: 'markshare101@gmail.com') do |user|
	user.password = 'password'
	#user.role = 'standard'
end
standard.skip_confirmation!
standard.save!
users = User.all

# Create Topics
20.times do
	Topic.create!(
		title: Faker::ProgrammingLanguage.name
	)
end
topics = Topic.all

# Create Bookmarks
50.times do
	bookmark = Bookmark.create!(
		topic: topics.sample,
		url: Faker::Internet.url,
		user: users.sample
	)
	rand(1..5).times { bookmark.likes.create!(user: users.sample) }
end
bookmarks = Bookmark.all

puts "Seeding Finished"
puts "-.-.-.-.-.-.-.-.-"
puts "#{User.count} total users"
puts "#{Topic.count} total topics"
puts "#{Bookmark.count} total bookmarks"