
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Coordinates for various locations in Memphis, Tennessee
MEMPHIS_LOCATIONS = [
  { location: "Downtown Memphis, Tennessee", latitude: 35.1495, longitude: -90.0490 },
  { location: "East Memphis, Tennessee", latitude: 35.1253, longitude: -89.9375 },
  { location: "Midtown Memphis, Tennessee", latitude: 35.1401, longitude: -89.9848 },
  { location: "South Memphis, Tennessee", latitude: 35.0868, longitude: -90.0568 },
  { location: "North Memphis, Tennessee", latitude: 35.2027, longitude: -90.0481 }
]

# Seed Users
bob = User.create!(
  email: "bob@email.com",
  password: "password",
  user_type: "Marketer",
  full_name: "Bob Jones",
  phone_number: "901-111-2222",
  contact_preference: "email",
  location: MEMPHIS_LOCATIONS[0][:location],
  latitude: MEMPHIS_LOCATIONS[0][:latitude],
  longitude: MEMPHIS_LOCATIONS[0][:longitude],
  organization_type: "Food retailer"
)

michael = User.create!(
  email: "michael@email.com",
  password: "password",
  user_type: "Marketer",
  full_name: "Michael Jackson",
  phone_number: "901-222-3333",
  contact_preference: "email",
  location: MEMPHIS_LOCATIONS[1][:location],
  latitude: MEMPHIS_LOCATIONS[1][:latitude],
  longitude: MEMPHIS_LOCATIONS[1][:longitude],
  organization_type: "Food retailer"
)

alice = User.create!(
  email: "alice@email.com",
  password: "password",
  user_type: "Farmer",
  full_name: "Alice Smith",
  phone_number: "901-333-4444",
  contact_preference: "text",
  location: MEMPHIS_LOCATIONS[2][:location],
  latitude: MEMPHIS_LOCATIONS[2][:latitude],
  longitude: MEMPHIS_LOCATIONS[2][:longitude],
  organization_type: "Farm"
)

buster = User.create!(
  email: "buster@email.com",
  password: "password",
  user_type: "Driver",
  full_name: "Buster Brown",
  phone_number: "901-444-5555",
  contact_preference: "text",
  location: MEMPHIS_LOCATIONS[3][:location],
  latitude: MEMPHIS_LOCATIONS[3][:latitude],
  longitude: MEMPHIS_LOCATIONS[3][:longitude],
  organization_type: "Truck driver"
)

quinn = User.create!(
  email: "quinn@email.com",
  password: "password",
  user_type: "Food Processor",
  full_name: "Quinn Taylor",
  phone_number: "901-555-6666",
  contact_preference: "email",
  location: MEMPHIS_LOCATIONS[4][:location],
  latitude: MEMPHIS_LOCATIONS[4][:latitude],
  longitude: MEMPHIS_LOCATIONS[4][:longitude],
  organization_type: "Food processors"
)

# Seed Products associated with Users
Product.create!(
  name: "Apples",
  amount: "5 crates",
  marketer: "Kroger Inc",
  expiration: Date.new(2024, 11, 18),
  hold: "3 days",
  user: bob
)

Product.create!(
  name: "Bananas",
  amount: "10 crates",
  marketer: "Kroger Inc",
  expiration: Date.new(2024, 11, 24),
  hold: "4 days",
  user: michael
)

Product.create!(
  name: "Lettuce",
  amount: "7 crates",
  marketer: "Whole Foods",
  expiration: Date.new(2024, 11, 15),
  hold: "5 days",
  user: alice
)

Product.create!(
  name: "Tomatoes",
  amount: "3 crates",
  marketer: "Farm Fresh Co.",
  expiration: Date.new(2024, 11, 10),
  hold: "6 days",
  user: buster
)

Product.create!(
  name: "Carrots",
  amount: "4 crates",
  marketer: "Green Thumb Inc.",
  expiration: Date.new(2024, 11, 20),
  hold: "7 days",
  user: quinn
)

Product.create!(
  name: "Apples",
  amount: "5 crates",
  marketer: "Kroger Inc",
  expiration: Date.new(2024, 11, 18),
  hold: "3 days",
  user: bob
)

Product.create!(
  name: "Lettuce",
  amount: "5 crates",
  marketer: "Walmart",
  expiration: Date.new(2024, 11, 3),
  hold: "5 days",
  user: michael
)
