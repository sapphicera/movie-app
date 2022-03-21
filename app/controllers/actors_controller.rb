class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render template: "actors/index"
  end

  def create
    @actor = Actor.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      known_for: params[:known_for],
      age: params[:age],
      gender: params[:gender].capitalize,
      movie_id: params[:movie_id]
    )

    if @actor.save
      render template: "actors/show"
    else
      render json: {errors: @actor.errors.full_messages}, status: 422
    end
  end

  def show
    @actor = Actor.find_by(id: params[:id])
    render template: "actors/show"
  end

  def update
    @actor = Actor.find_by(id: params[:id])

    @actor.first_name = params[:first_name] || @actor.first_name
    @actor.last_name = params[:last_name] || @actor.last_name
    @actor.known_for = params[:known_for] || @actor.known_for
    @actor.age = params[:age] || @actor.age
    @actor.gender = params[:gender].capitalize || @actor.gender
    @actor.movie_id = params[:movie_id] || @actor.movie_id

    if @actor.save
      render template: "actors/show"
    else
      render json: {errors: @actor.errors.full_messages}, status: 422
    end
  end

  def delete
    actor = Actor.find_by(id: params[:id])
    Actor.exists?(params[:id]) ? (actor.destroy; message = "successfully deleted") : (message = "actor does not exist")
    render json: {message: message}
  end
end
