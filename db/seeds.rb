poll1 = Poll.create(
  title: 'What is your favorite programming language?',
  description: 'Choose your preferred programming language.'
)

choice1_1 = poll1.choices.create(content: 'Ruby')
choice1_2 = poll1.choices.create(content: 'Python')
choice1_3 = poll1.choices.create(content: 'JavaScript')

poll2 = Poll.create(
  title: 'What is your favorite web framework?',
  description: 'Choose your preferred web framework.'
)

choice2_1 = poll2.choices.create(content: 'Ruby on Rails')
choice2_2 = poll2.choices.create(content: 'Django')
choice2_3 = poll2.choices.create(content: 'React')

users_data = (1..10).map { |i| { email: "user#{i}@example.com", password: '123456' } }
users = User.create(users_data)

group_1_users = users.first(5)
group_2_users = users.last(5)

group_1_users.each_with_index do |user, index|
  choice = case index
           when 0, 1 then choice1_1
           when 2, 3 then choice1_2
           else choice1_3
           end
  user.votes.create(choice: choice)
end

group_2_users.each_with_index do |user, index|
  choice = case index
           when 0, 1 then choice2_1
           when 2, 3 then choice2_2
           else choice2_3
           end
  user.votes.create(choice: choice)
end

puts 'Polls, choices, users, and votes have been created successfully!'
