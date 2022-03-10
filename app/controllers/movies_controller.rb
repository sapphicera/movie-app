class MoviesController < ApplicationController
  def list_movies
    movies = Movie.all
    render json: movies.as_json
  end

  def search_id
    id = params[:id]
    movie = Movie.find(id)
    render json: movie.as_json
  end

  def random_movie
    random_num = rand(Movie.count)
    rand_movie = Movie.offset(random_num).first
    render json: rand_movie.as_json
  end

  def by_letter
    letter = params[:l].downcase
    displayed_movies = []

    Movie.find_each do |movie|
      displayed_movies << movie if movie.title[0].downcase == letter
    end

    render json: displayed_movies.as_json
  end

  def search_title
    search = params[:movie_name]
    movie_result = Movie.find_by("lower(title) = ?", search.downcase)
    render json: movie_result.as_json
  end
end
