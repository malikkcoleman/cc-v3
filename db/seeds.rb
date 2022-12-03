# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# require 'csv'
# csv_text = File.read('/Users/colemancapsule/Documents/RRCWEBD3008/collectors_club_v3/db/csv/categories.csv')
# puts csv_text
# CSV.foreach('/Users/colemancapsule/Documents/RRCWEBD3008/collectors_club_v3/db/csv/categories.csv', headers: true) do |row|
#   Category.create({
#     name: row["name"],
#     description: row["description"],
#     image: row["image"]
#   })
# end

require 'csv'
csv_text = File.read('/Users/colemancapsule/Documents/RRCWEBD3008/collectors_club_v3/db/csv/products.csv')
puts csv_text
CSV.foreach('/Users/colemancapsule/Documents/RRCWEBD3008/collectors_club_v3/db/csv/products.csv', headers: true) do |row|
  Product.create({
    name: row["name"],
    price: row["price"],
    description: row["description"],
    image: row["image"],
    qty: row["qty"],
    category_id: row["category_id"]
  })
end