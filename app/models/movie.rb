class Movie < ApplicationRecord
  validates :title, uniqueness: { scope: :director }
  validates :title, :year, :director, presence: true
  validates :plot, length: { maximum: 500 }
  validates :year, numericality: { in: 1878..2022 }

  has_many :actors

  has_many :movie_genres
  has_many :genres, through: :movie_genres

  def genre_names
    genre_list = []
    movie_genres.each{|g| genre_list << g.genre.name}
    genre_list
  end
end