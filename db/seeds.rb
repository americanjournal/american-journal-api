# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(age: 30, candidate: "Hillary", username: "aaronstrick")

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

  num_users = User.count
  num_stories = Story.count

  100.times do
    ["love", "inspired"].each do |feeling|
      rand_user = rand(num_users) + 1
      rand_story = rand(num_stories) + 1

      Reaction.create(feeling: feeling, user_id: rand_user, story_id: rand_story)
    end
  end

end


