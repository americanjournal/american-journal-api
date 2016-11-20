require 'httparty'
require 'pry'

user_id = 1
story_id = 1


response = HTTParty.post(
	'http://localhost:3000/reactions', 
	:query => { 
		"story_id" => story_id, 
        "feeling" => "angry" 
    }
)
binding.pry
