Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/list_actors" => "actors#list_actors"
  get "/list_movies" => "movies#list_movies"
  get "/search" => "movies#search_id"
  get "/random_movie" => "movies#random_movie"
  get "/by_letter" => "movies#by_letter"
  get "/search/:movie_name" => "movies#search_title"
end
