class ValuesController < ApplicationController
  respond_to :json

  def index
    values = Value.all
    respond_with(values)
  end

  def show
    value = Value.includes(:stories).where(id: params[:id]).first
    if value
      stories = value.stories
      data = {
        id: value.id,
        name: value.name,
        prompt: value.prompt,
        stories: stories
      }

      render json: data, status: 200
    else

      render json: { error: "coulnd't find value" }, status: 422
    end
  end
end
