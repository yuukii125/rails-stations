class Reservation < ApplicationRecord
  belongs_to :schedule
  belongs_to :sheet

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :date, presence: true, uniqueness: { scope: :schedule_id }
  validates :schedule_id, presence: true
  validates :sheet_id, presence: true
  validates :name, presence: true
end
