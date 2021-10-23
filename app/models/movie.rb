class Movie < ApplicationRecord
  validates :name, length: { maximum: 160 }, uniqueness: true
  validates :year, length: { maximum: 45 }
  validates :image_url, length: { maximum: 255 }

  with_options presence: true do
    validates :name
    validates :description
    validates :image_url
    validates :year
  end
end
