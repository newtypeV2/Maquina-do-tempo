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
daenerys = User.create(name: "Daenerys",location: "Washington, D.C.",age: 64, gender: "female")
cersei = User.create(name: "Cersei",location: "Washington, D.C.",age: 70, gender: "female")
stahl = User.create(name: "Stahl",location: "Washington, D.C.",age: 60, gender: "male")
khal = User.create(name: "Khal",location: "Washington, D.C.",age: 65, gender: "male")
shae = User.create(name: "Shae",location: "Washington, D.C.",age: 68, gender: "female")

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
