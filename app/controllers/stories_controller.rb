class StoriesController < ApplicationController
  respond_to :json

  def show
    story = Story.where(id: params[:id]).first
    if story
      render json: story, status: 200
    else
      render json: { error: "coulnd't find story" }, status: 422
    end
  end
end
