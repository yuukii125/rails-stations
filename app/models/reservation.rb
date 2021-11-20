class Reservation < ApplicationRecord
  belongs_to :schedule
  belongs_to :sheet

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
