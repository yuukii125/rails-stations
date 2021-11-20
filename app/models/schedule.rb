class Schedule < ApplicationRecord
  belongs_to :movie
  has_many :reservations, dependent: :destroy

  validates :start_time, presence: true
  validates :end_time, presence: true
end
