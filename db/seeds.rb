puts 'Creating games'

Slot.destroy_all
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

20.times do |i|
  User.create!({
    username: Faker::Twitter.screen_name,
    email: Faker::Internet.email,
    password: '123456',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    country: ["Singapore", "China", "England", "USA"].sample,
    skype_discord: Faker::FunnyName.two_word_name,
    profile_picture: Faker::Avatar.image,
    receive_email: true,
    on_vacation: false,
    rates: rand(10..100),
    coach_since: Faker::Date.birthday,
    profile_content: Faker::Lorem.paragraph(sentence_count: 5)
  })
  User.last.games << Game.all.sample << Game.all.sample << Game.all.sample
  # User.last.slots << Slot.create(booked: false, date: Date.today, user: User.last)
  10.times do |i|
    Slot.create!({
      booked: false,
      date: Date.today + rand(30),
      user: User.last
    })
  end
end

puts 'Created users'
