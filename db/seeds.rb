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
standard = User.find_or_initialize_by(username: 'standard', email: 'standard@markshare.com') do |user|
	user.password = 'password'
	#user.role = 'standard'
end
standard.skip_confirmation!
standard.save!
users = User.all

puts "Seeding Finished"
puts "-.-.-.-.-.-.-.-.-"
puts "#{User.count} total users"