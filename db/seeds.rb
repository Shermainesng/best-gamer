puts 'Creating games'

Game.destroy_all
User.destroy_all

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
    password: '123456',
    username: Faker::Name.first_name,
    rates: rand(10..100),
    country: ["Singapore", "China", "England"].sample
  })
  User.last.games << Game.all.sample << Game.all.sample << Game.all.sample
  User.last.slots << Slot.create(status: false, date: Date.today, user: User.last)
end

puts 'Created users'
