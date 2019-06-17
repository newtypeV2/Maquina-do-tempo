# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
jon = User.find_or_create_by(name: "Jon",location: "Washington, D.C.",age: 72, gender: "male")
daenerys = User.find_or_create_by(name: "Daenerys",location: "Washington, D.C.",age: 64, gender: "female")
cersei = User.find_or_create_by(name: "Cersei",location: "Washington, D.C.",age: 70, gender: "female")
stahl = User.find_or_create_by(name: "Stahl",location: "Washington, D.C.",age: 60, gender: "male")
khal = User.find_or_create_by(name: "Khal",location: "Washington, D.C.",age: 65, gender: "male")
shae = User.find_or_create_by(name: "Shae",location: "Washington, D.C.",age: 68, gender: "female")

Match.create(swiper_id: jon.id , swiped_id: shae.id)
Match.create(swiper_id: jon.id, swiped_id: cersei.id)
Match.create(swiper_id: jon.id, swiped_id: daenerys.id)

Match.create(swiper_id: daenerys.id, swiped_id: khal.id)
Match.create(swiper_id: daenerys.id, swiped_id: stahl.id)

Match.create(swiper_id: stahl.id, swiped_id: jon.id)
Match.create(swiper_id: stahl.id, swiped_id: khal.id)

Match.create(swiper_id: khal.id, swiped_id: daenerys.id)
Match.create(swiper_id: khal.id, swiped_id: cersei.id)

Match.create(swiper_id: shae.id, swiped_id: jon.id) #for match testing
Match.create(swiper_id: shae.id, swiped_id: khal.id)
