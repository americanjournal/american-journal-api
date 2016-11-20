require "csv"

namespace :import do
  desc "Import the data from the form"
  task :data => :environment do
    file_name = Rails.root.join('db/data.csv')

    user = User.create(age: 30, candidate: "NoOne", username: "the_global_user")

    CSV.read(file_name).each do |row|
      value_name = row.shift
      prompt = row.shift

      puts "value name: #{value_name}"
      puts "prompt: #{prompt}"

      value = Value.create(name: value_name, prompt: prompt)
      row.each do |story|
        if story
          Story.create(value_id: value.id, story: story, user_id: user.id)
        end
      end
    end
  end
end
