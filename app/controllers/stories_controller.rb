class StoriesController < ApplicationController
  respond_to :json

  def show
    story = Story.where(id: params[:id]).first

    data =
      { story: {
          text: story.story
        },
        reactions: story.reactions.group(:feeling).count

      }

    if story
      render json: data, status: 200
    else
      render json: { error: "coulnd't find story" }, status: 422
    end
  end

  # member of value
  def create
    story = Story.new(
      user_id: User.first.id, # TODO: We need to auth users = User.first
      value_id: params[:value_id],
      story: story_params[:story]
    )

    if story.save
      render json: story, status: 200
    else
      render json: { error: story.errors.messages }, status: 422
    end
  end

  private
  def story_params
    params.require(:story).permit(:story)
  end
end
