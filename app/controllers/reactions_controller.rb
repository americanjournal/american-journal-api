class ReactionsController < ApplicationController

	# for testing only
	skip_before_filter :verify_authenticity_token

	def index 
		current_user = User.first
		story_id = params[:story_id]
		reactions = Reaction.where(user_id: current_user.id, story_id: story_id)
		render :json => {
					all_reactions: reactions
				}
	end

	def create
		current_user = User.first
		story_id = params[:story_id]
		feeling = params[:feeling]
		reaction = Reaction.new(
			story_id: story_id, 
			user_id: current_user.id,
			feeling: feeling
		)
		
		puts "Hello world"
		puts reaction.inspect
		
		if reaction.save 
			reactions = Reaction.where(user_id: current_user.id, story_id: story_id)
			render json: {
					new_reaction: reaction,
					all_reactions: reactions
				}
		else
			render json: { 
				error: reaction.errors.full_messages.first 
				}, 
				status: 400
		end

	end
end
