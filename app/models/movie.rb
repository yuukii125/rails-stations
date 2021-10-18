class Movie < ApplicationRecord
  validates :name, presence: true, length: { maximum: 160 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 45 }
  validates :image_url, length: { maximum: 45 }
end
