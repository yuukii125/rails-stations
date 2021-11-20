class Sheet < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :movie, dependent: :destroy
end
