class ActorsController < ApplicationController
  def list_actors
    actor = Actor.find_by(id:6)
    render json: {message: actor}
  end
end
