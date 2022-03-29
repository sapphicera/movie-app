class MovieGenresController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  before_action :authenticate_user

  def create
    moviegenre = MovieGenre.new(
      movie_id: params[:movie_id],
      genre_id: params[:genre_id]
    )
    moviegenre.save
    render json: {message: "saved!"}
  end
  
end