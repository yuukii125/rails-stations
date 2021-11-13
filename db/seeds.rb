# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  Movie.create([{ name: 'Star Wars', is_showing:"0" }, { name: 'Lord of the Rings', is_showing:"0" }])
#   Character.create(name: 'Luke', movie: movies.first)


15.times do |n|
  Sheet.create!(
    column: n + 1,
    row: ("a".ord + (n/5)).chr
  )
end
