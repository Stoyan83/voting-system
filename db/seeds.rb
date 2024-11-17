user_data = [
  { email: 'user1@example.com' },
  { email: 'user2@example.com' },
  { email: 'user3@example.com' },
  { email: 'user4@example.com' },
  { email: 'user5@example.com' },
  { email: 'user6@example.com' }
]

users = User.create!(user_data.map { |user| user.merge(password: '123456', password_confirmation: '123456') })


poll_data = [
  { title: 'Best Coffee', description: 'What is your favorite type of coffee?', choices: ['Espresso', 'Latte', 'Cappuccino', 'Americano'] },
  { title: 'Best Vacation Spot', description: 'Where would you like to go for vacation?', choices: ['Paris', 'Tokyo', 'New York', 'Sydney'] },
  { title: 'Best Sports Team', description: 'Which sports team do you support?', choices: ['FC Barcelona', 'Los Angeles Lakers', 'New York Yankees', 'Manchester United'] },
  { title: 'Favorite Animal', description: 'Which animal do you think is the best?', choices: ['Dog', 'Cat', 'Elephant', 'Dolphin'] },
  { title: 'Favorite Programming Framework', description: 'Which programming framework do you prefer?', choices: ['Ruby on Rails', 'React', 'Django', 'Angular'] }
]

poll_data.each do |poll|
  created_poll = Poll.create!(title: poll[:title], description: poll[:description])
  created_poll.choices.create!(poll[:choices].map { |choice| { content: choice } })
end

puts '🎉 The development database has been successfully seeded! 🎉'
