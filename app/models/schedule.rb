class Schedule < ApplicationRecord
  belongs_to :movie
  has_many :reservations, dependent: :destroy
  accepts_nested_attributes_for :reservations, allow_destroy: true

  validates :start_time, presence: true
  validates :end_time, presence: true
end
