puts 'Creating games'

Slot.destroy_all
Game.destroy_all
User.destroy_all

games = ['League of Legends', 'Valorant', "Dota 2", "Fortnite"]
games.each do |game|
  game_inst = Game.create!({
    name: game
  })
  puts "#{game} created"
  12.times do
    username = Faker::Twitter.screen_name
    puts "creating #{username}"

    User.create!({
      username: username,
      email: Faker::Internet.email,
      password: '123456',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      country: ["Singapore", "China", "England", "USA"].sample,
      skype_discord: Faker::FunnyName.two_word_name,
      profile_picture: "https://avatars.dicebear.com/api/big-smile/#{username}.svg",
      receive_email: true,
      on_vacation: false,
      rates: rand(10..100),
      coach_since: Faker::Date.birthday,
      profile_content: Faker::Lorem.paragraph(sentence_count: 5)
    })
    User.last.games << game_inst
    10.times do
      @start = Faker::Time.between(from: DateTime.now, to: (DateTime.now + 2.month))
      @end = @start + 1.hour
      Slot.create!({
        booked: false,
        date: @start.to_date,
        user: User.last,
        start: @start.to_time,
        end: @end.to_time
      })
    end
  end
end

puts 'All done'
