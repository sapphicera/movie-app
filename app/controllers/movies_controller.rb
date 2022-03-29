class MoviesController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  before_action :authenticate_user

  def index
    movies = Movie.all
    render json: movies
  end

  def create
    movie = Movie.new(
      title: params[:title],
      year: params[:year],
      plot: params[:plot],
      director: params[:director],
      english: params[:english] || true
    )

    if movie.save
      render json: {message: "movie saved!"}
    else
      render json: {errors: movie.errors.full_messages}, status: 422
    end
  end

  def show
    movie = Movie.find_by(id: params[:id])
    render json: movie.as_json
  end

  def update
    movie = Movie.find_by(id: params[:id])

    movie.title = params[:title] || movie.title
    movie.year = params[:year] || movie.year
    movie.plot = params[:plot] || movie.plot
    movie.director = params[:director] || movie.director
    movie.english = params[:english] || movie.english

    if movie.save
      render json: {message: "movie updated!"}
    else
      render json: {errors: movie.errors.full_messages}, status: 422
    end
  end

  def delete
    movie = Movie.find_by(id: params[:id])
    Movie.exists?(params[:id]) ? (movie.destroy; message = "successfully deleted") : (message = "movie does not exist")
    render json: {message: message}
  end

  # def random_movie
  #   # other ways to randomize the order of all data... should probably avoid on larger databases.
  #   # rand_movie = Movie.order(Arel.sql('RANDOM()')).first
  #   # rand_movie = Movie.order("RANDOM()").first
  #   random_num = rand(Movie.count)
  #   rand_movie = Movie.offset(random_num).first
  #   puts rand_movie

  #   render json: rand_movie.as_json
  # end

  # def by_letter
  #   letter = params[:l].downcase
  #   displayed_movies = []

  #   Movie.find_each do |movie|
  #     displayed_movies << movie if movie.title[0].downcase == letter
  #   end

  #   render json: displayed_movies.as_json
  # end

  # def search_title
  #   search = params[:movie_name]
  #   movie_result = Movie.find_by("lower(title) = ?", search.downcase)
  #   render json: movie_result.as_json
  # end
  
end
