puts 'Creating games'

games = ['League of Legends', 'Valorant', "Dota 2", "Fortnite"]
games.each do |game|
  Game.create!({
    name: game
  })
end

puts 'Games created'

puts 'Creating users'

5.times do |i|
  User.create!({
    email: Faker::Internet.email,
    encrypted_password: 'abc',
    username: Faker::Name.first_name,
    rates: rand(10..100)
  })
end

puts 'Created users'
