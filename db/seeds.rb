# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


["Security", "Patriotism", "Human Equality"].each do |value_name|
  value = Value.create(name: value_name)

  ["Aaron", "Jared", "Emily", "Jing", "Rohan"].each do |person_name|
    u = User.create(
      username: person_name,
      age: 20 * rand(1.3).round,
      candidate: %w{Trump Hillary}[rand(1)]
    )

    4.times do |idx| 
      Story.create(value_id: value.id, story: Faker::Hipster.sentence(20), user_id: u.id)
    end
  end
end


