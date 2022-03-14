class ActorsController < ApplicationController
  def index
    actors = Actor.all
    render json: actors.as_json
  end

  def create
    actor = Actor.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      known_for: params[:known_for]
    )
    render json: {message: "actor created!"}
  end

  def show
    actor = Actor.find_by(id: params[:id])
    render json: actor.as_json
  end

  def update
    actor = Actor.find_by(id: params[:id])

    actor.first_name = params[:first_name] || actor.first_name
    actor.last_name = params[:last_name] || actor.last_name
    actor.known_for = params[:known_for] || actor.known_for

    actor.save
    render json: {message: "actor updated!"}
  end

  def delete
    actor = Actor.find_by(id: params[:id])
    Actor.exists?(params[:id]) ? (actor.destroy; message = "successfully deleted") : (message = "actor does not exist")
    render json: {message: message}
  end
end
