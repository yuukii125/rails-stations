class Movie < ApplicationRecord
  validates :name, presence: true, length: { maximum: 160 }, uniqueness: true
  validates :description, length: { maximum: 500 }
  validates :image_url, length: { maximum: 160 }, format: /\A#{URI::regexp(%w(http https))}\z/

  has_many :schedules, dependent: :destroy
  has_one :screen
end
