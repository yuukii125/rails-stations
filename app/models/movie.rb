class Movie < ApplicationRecord
  validates :name, presence: true, length: { maximum: 160 }, uniqueness: true
  validates :year, length: { maximum: 45 }
end
