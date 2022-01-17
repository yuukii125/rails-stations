class Screen < ApplicationRecord
  belongs_to :movie

  validates :screen_number, presence: true, uniqueness: { scope: [:movie_id] }
end
