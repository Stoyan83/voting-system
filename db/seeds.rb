poll = Poll.create(
  title: 'What is your favorite programming language?',
  description: 'Choose your preferred programming language.'
)

choice1 = poll.choices.create(content: 'Ruby')
choice2 = poll.choices.create(content: 'Python')

users = [
  { email: 'user1@example.com', password: 'password123' },
  { email: 'user2@example.com', password: 'password123' },
  { email: 'user3@example.com', password: 'password123' },
  { email: 'user4@example.com', password: 'password123' }
]

created_users = users.map do |user_data|
  User.create(user_data)
end

group_1_users = created_users[0..1] 
group_2_users = created_users[2..3]  


group_1_users.each do |user|
  user.votes.create(choice: choice1)
end


group_2_users.each do |user|
  user.votes.create(choice: choice2)
end

puts "Poll and choices created successfully!"
puts "Users and votes have been recorded."
