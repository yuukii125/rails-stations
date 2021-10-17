class Movie < ApplicationRecord
  enum is_showing: { 上映予定: "0", 上映中: "1" }
end
