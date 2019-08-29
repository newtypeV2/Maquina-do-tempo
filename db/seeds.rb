# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Match.destroy_all


john = User.create(name: "John",location: "Washington, D.C.",age: 72, gender: "male", password: "password", username: "john")
john.avatar.attach(io: File.open("profilepics/john.png"), filename:"john.png", content_type: "image/png")

anna = User.create(name: "Anna",location: "Washington, D.C.",age: 64, gender: "female", password: "password", username: "anna")
anna.avatar.attach(io: File.open("profilepics/anna.png"), filename: "anna.png", content_type: "image/png")

juliete = User.create(name: "Juliete",location: "Washington, D.C.",age: 70, gender: "female", password: "password", username: "juliete")
juliete.avatar.attach(io: File.open("profilepics/juliete.png"), filename: "juliete.png", content_type: "image/png")

david = User.create(name: "David",location: "Washington, D.C.",age: 60, gender: "male", password: "password", username: "david")
david.avatar.attach(io: File.open("profilepics/david.png"), filename: "david.png", content_type: "image/png")

anthony = User.create(name: "Anthony",location: "Washington, D.C.",age: 65, gender: "male", password: "password", username: "anthony")
anthony.avatar.attach(io: File.open("profilepics/anthony.png"), filename: "anthony.png", content_type: "image/png")

marie = User.create(name: "Marie",location: "Washington, D.C.",age: 68, gender: "female", password: "password", username: "marie")
marie.avatar.attach(io: File.open("profilepics/marie.png"), filename: "marie.png", content_type: "image/png")

x = 1
11.times do
    user = User.create(name: Faker::Name.male_first_name ,location: "#{Faker::Address.city }, #{Faker::Address.state_abbr}" ,age:rand(60..70) , gender: "male", password: "password", username: ("user-m"+"#{x}"))
    user.avatar.attach(io: File.open("profilepics/man#{x}.png"), filename: "man#{x}.png", content_type: "image/png")
    x+=1
end

x = 1
11.times do
    user = User.create(name: Faker::Name.female_first_name ,location: "#{Faker::Address.city }, #{Faker::Address.state_abbr}" ,age:rand(60..70) , gender: "female", password: "password", username: ("user-f"+"#{x}"))
    user.avatar.attach(io: File.open("profilepics/woman#{x}.png"), filename: "woman#{x}.png", content_type: "image/png")
    x+=1
end


Match.create(swiper_id: john.id , swiped_id: marie.id, gave_chance: true)
Match.create(swiper_id: john.id, swiped_id: juliete.id, gave_chance: true)
Match.create(swiper_id: john.id, swiped_id: david.id, gave_chance: true)
Match.create(swiper_id: john.id, swiped_id: anthony.id, gave_chance: true)


Match.create(swiper_id: david.id, swiped_id: john.id, gave_chance: true)
Match.create(swiper_id: david.id, swiped_id: marie.id, gave_chance: false)
Match.create(swiper_id: david.id, swiped_id: anna.id, gave_chance: true)
Match.create(swiper_id: david.id, swiped_id: juliete.id, gave_chance: true)

Match.create(swiper_id: anthony.id , swiped_id: marie.id, gave_chance: true)
Match.create(swiper_id: anthony.id, swiped_id: juliete.id, gave_chance: true)
Match.create(swiper_id: anthony.id, swiped_id: anna.id, gave_chance: true)
Match.create(swiper_id: anthony.id, swiped_id: david.id, gave_chance: false)

Match.create(swiper_id: anna.id, swiped_id: david.id, gave_chance: true)
Match.create(swiper_id: anna.id , swiped_id: anthony.id, gave_chance: true)
Match.create(swiper_id: anna.id, swiped_id: juliete.id, gave_chance: true)
Match.create(swiper_id: anna.id, swiped_id: marie.id, gave_chance: true)
Match.create(swiper_id: anna.id, swiped_id: john.id, gave_chance: true)

Match.create(swiper_id: juliete.id, swiped_id: anna.id, gave_chance: true)
Match.create(swiper_id: juliete.id, swiped_id: marie.id, gave_chance: true)
Match.create(swiper_id: juliete.id, swiped_id: john.id, gave_chance: true)
Match.create(swiper_id: juliete.id, swiped_id: david.id, gave_chance: true)

Match.create(swiper_id: marie.id, swiped_id: john.id, gave_chance: true)
Match.create(swiper_id: marie.id, swiped_id: david.id, gave_chance: true)
Match.create(swiper_id: marie.id , swiped_id: anthony.id, gave_chance: true)
Match.create(swiper_id: marie.id, swiped_id: juliete.id, gave_chance: true)
Match.create(swiper_id: marie.id, swiped_id: anna.id, gave_chance: true)


# Message.create(sender_id: john.id, receiver_id: anna.id, content: "How you doin?")
# Message.create(sender_id: anna.id, receiver_id: john.id, content: "I'm doing fine. Do you like soccer?")
# Message.create(sender_id: john.id, receiver_id: anna.id, content: "Not really")
# Message.create(sender_id: anna.id, receiver_id: john.id, content: "cool")
# Message.create(sender_id: john.id, receiver_id: anna.id, content: "are you still there?")

Message.create(sender_id: anna.id, receiver_id: marie.id, content: "Hi")
Message.create(sender_id: anna.id, receiver_id: marie.id, content: "I'm lookin for a travel buddy")
Message.create(sender_id: marie.id, receiver_id: anna.id, content: "Hey, that's fun")
Message.create(sender_id: anna.id, receiver_id: marie.id, content: "yes, I have a RV and stuff")
Message.create(sender_id: marie.id, receiver_id: anna.id, content: "let's do it!!")

Message.create(sender_id: anna.id, receiver_id: david.id, content: "Hi handsome")
Message.create(sender_id: anna.id, receiver_id: david.id, content: "Do you have snapchat?")   

Message.create(sender_id: anthony.id, receiver_id: anna.id, content: "Want to marry me?")
Message.create(sender_id: anna.id, receiver_id: anthony.id, content: "...")

Message.create(sender_id: david.id, receiver_id: anthony.id, content: "what's up?")
Message.create(sender_id: david.id, receiver_id: john.id, content: "what's up?")
Message.create(sender_id: david.id, receiver_id: juliete.id, content: "what's up?")
Message.create(sender_id: david.id, receiver_id: marie.id, content: "what's up?")


Message.create(sender_id: john.id, receiver_id: juliete.id, content: "How you doin?")
Message.create(sender_id: john.id, receiver_id: marie.id, content: "How you doin?")