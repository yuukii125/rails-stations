class Sheet < ApplicationRecord
  has_one :reservations
  accepts_nested_attributes_for :reservations, allow_destroy: true

end
