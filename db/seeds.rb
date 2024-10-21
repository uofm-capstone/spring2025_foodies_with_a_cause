
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.create!(
  name: "Apples",
  amount: "5 crates",
  marketer: "Kroger Inc",
  expiration: Date.new(2024, 11, 18),
  hold: "3 days"
)

Product.create!(
  name: "Apples",
  amount: "5 crates",
  marketer: "Kroger Inc",
  expiration: Date.new(2024, 11, 24),
  hold: "4 days"
)

Product.create!(
  name: "Lettuce",
  amount: "5 crates",
  marketer: "Walmart",
  expiration: Date.new(2024, 11, 3),
  hold: "5 days"
)

Product.create!(
  name: "Bananas",
  amount: "7 crates",
  marketer: "Kroger Inc",
  expiration: Date.new(2024, 11, 7),
  hold: "7 days"
)

User.create!(
  email: "user@email.com",
  password: "password",
  user_type: "Marketer",
  full_name: "Bob Jones",
  phone_number: "901-111-2222",
  contact_preference: "Email",
  location: "Memphis",
  organization_type: "Grocery Store"
)
