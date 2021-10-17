class Movie < ApplicationRecord
  enum is_showing: { 上映予定: false, 上映中: true }
end
