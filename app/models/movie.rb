class Movie < ApplicationRecord
  validates :title, uniqueness: { scope: :director }
  validates :title, :year, :director, presence: true
  validates :plot, length: { maximum: 500 }
  validates :year, numericality: { in: 1878..2022 }
end