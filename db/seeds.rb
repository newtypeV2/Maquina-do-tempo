# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Match.destroy_all


jon = User.create(name: "Jon",location: "Washington, D.C.",age: 72, gender: "male", password: "password", username: "jon")
jon.avatar.attach(io: File.open("profilepics/jon.jpg"), filename: "jon.jpg", content_type: "image/jpg")

daenerys = User.create(name: "Daenerys",location: "Washington, D.C.",age: 64, gender: "female", password: "password", username: "nerys")
daenerys.avatar.attach(io: File.open("profilepics/daenerys.jpg"), filename: "daenerys.jpg", content_type: "image/jpg")

cersei = User.create(name: "Cersei",location: "Washington, D.C.",age: 70, gender: "female", password: "password", username: "cersei")
cersei.avatar.attach(io: File.open("profilepics/cersei.jpg"), filename: "cersei.jpg", content_type: "image/jpg")

stahl = User.create(name: "Stahl",location: "Washington, D.C.",age: 60, gender: "male", password: "password", username: "stahl")
stahl.avatar.attach(io: File.open("profilepics/stahl.jpg"), filename: "stahl.jpg", content_type: "image/jpg")

khal = User.create(name: "Khal",location: "Washington, D.C.",age: 65, gender: "male", password: "password", username: "khal")
khal.avatar.attach(io: File.open("profilepics/khal.jpg"), filename: "khal.jpg", content_type: "image/jpg")

shae = User.create(name: "Shae",location: "Washington, D.C.",age: 68, gender: "female", password: "password", username: "shae")
shae.avatar.attach(io: File.open("profilepics/shae.jpg"), filename: "shae.jpg", content_type: "image/jpg")

x = 1
6.times do
    user = User.create(name: Faker::Name.male_first_name ,location: "#{Faker::Address.city }, #{Faker::Address.state_abbr}" ,age:rand(60..70) , gender: "male", password: "password", username: ("user-m"+"#{x}"))
    user.avatar.attach(io: File.open("profilepics/man#{x}.jpg"), filename: "man#{x}.jpg", content_type: "image/jpg")
    x+=1
end

x = 1
6.times do
    user = User.create(name: Faker::Name.female_first_name ,location: "#{Faker::Address.city }, #{Faker::Address.state_abbr}" ,age:rand(60..70) , gender: "female", password: "password", username: ("user-f"+"#{x}"))
    user.avatar.attach(io: File.open("profilepics/woman#{x}.jpg"), filename: "woman#{x}.jpg", content_type: "image/jpg")
    x+=1
end


Match.create(swiper_id: jon.id , swiped_id: shae.id, gave_chance: true)
Match.create(swiper_id: jon.id, swiped_id: cersei.id, gave_chance: true)
Match.create(swiper_id: jon.id, swiped_id: daenerys.id, gave_chance: true)

Match.create(swiper_id: daenerys.id, swiped_id: khal.id, gave_chance: true)
Match.create(swiper_id: daenerys.id, swiped_id: stahl.id, gave_chance: false)
Match.create(swiper_id: daenerys.id, swiped_id: jon.id, gave_chance: true)

Match.create(swiper_id: cersei.id, swiped_id: jon.id, gave_chance: false)

Match.create(swiper_id: stahl.id, swiped_id: jon.id, gave_chance: true)
Match.create(swiper_id: stahl.id, swiped_id: khal.id, gave_chance: true)

Match.create(swiper_id: khal.id, swiped_id: daenerys.id, gave_chance: true)
Match.create(swiper_id: khal.id, swiped_id: cersei.id, gave_chance: false)

Match.create(swiper_id: shae.id, swiped_id: jon.id, gave_chance: true) #for match testing
Match.create(swiper_id: shae.id, swiped_id: khal.id, gave_chance: false)


Message.create(sender_id: jon.id, receiver_id: shae.id, content: "How you doin?")
Message.create(sender_id: shae.id, receiver_id: jon.id, content: "I'm doing fine. How was your watch last night?")
Message.create(sender_id: jon.id, receiver_id: shae.id, content: "It was cool, we killed a lot of wight walkers. Other than that, it was normal")
Message.create(sender_id: shae.id, receiver_id: jon.id, content: "Oh cool, when is the next time you're coming to Kings Landing? Maybe we can grabe some Starbucks")
Message.create(sender_id: jon.id, receiver_id: shae.id, content: "Oh sure, we're planning a war against Cersei so we'll probably be there next week. See you then!")
Message.create(sender_id: shae.id, receiver_id: jon.id, content: "Sounds great! See you then!")
