class ReactionsController < ApplicationController


	def get 
		story_id = params[:story_id]
	end

	def post
		current_user = User.first
		story_id = params[:story_id]
		feeling = params[:feeling]
		reaction = Reaction.new(
			story_id: story_id, 
			user_id: current_user.id
			feeling: feeling
		)
		
		if reaction.save 
			reactions = Reaction.all(user_id: user_id, story_id: story_id)
			render 
				json: {
					new_reaction: reaction,
					all_reactions: reactions
				}
		else
			render 
				json: { error: reaction.errors.full_messages.first }, 
				status: 400
		end

	end
end
