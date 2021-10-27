class Movie < ApplicationRecord
  validates :name, presence: true, length: { maximum: 160 }, uniqueness: true
  validates :description, length: { maximum: 500 }
  validates :image_url, length: { maximum: 160 }

end
