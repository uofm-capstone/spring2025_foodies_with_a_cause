
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ food_type: "Star Wars" }, { food_type: "Lord of the Rings" }])
#   Character.create(food_type: "Luke", movie: movies.first)



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

user1 = User.create!(
  email: "user1@email.com",
  password: "password",
  full_name: "User One",
  phone_number: "123-456-7890",
  contact_preference: "email",
  organization_type: "Farm",
  user_type: "Donor",
  location: "123 Farm Rd",
  latitude: 35.1495,
  longitude: -90.0490
)

user2 = User.create!(
  email: "user2@email.com",
  password: "password",
  full_name: "User Two",
  phone_number: "987-654-3210",
  contact_preference: "text",
  organization_type: "Food pantry / soup kitchen",
  user_type: "Recipient",
  location: "456 Pantry Blvd",
  latitude: 35.1449,
  longitude: -90.0510
)



admin_user = User.create!(
  email: "admin@email.com",
  password: "password",
  user_type: "Admin",
  full_name: "Admin User",
  phone_number: "901-555-5555",
  contact_preference: "email",
  location: "Admin Headquarters",
  latitude: 35.1495,
  longitude: -90.0490,
  organization_type: "Individual (not associated with an organization)",
  admin: true  # Set this user as an admin
)



# Seed Products associated with Users

Product.create!(
  food_type: "Tomatoes",
  quantity: 15,
  marketer: "User 1 Inc.",
  description: "Organic tomatoes!",
  hold:"5 days",
  user: user1
)

Product.create!(
  food_type: "Canned Beans",
  quantity: 36,
  marketer: "User 2 Inc.",
  description: "High-protein canned beans for community meals.",
  hold:"80 days",
  user: user2
)


Product.create!(
  food_type: "Apples",
  quantity: 5,
  marketer: "Kroger Inc",
  description: "Blemished apples that could be better use for a farm",
  hold:"4 days",
  user: bob
)

Product.create!(
  food_type: "Bananas",
  quantity: 10,
  marketer: "Kroger Inc",
  description: "Blemished produce that could be better use for a farm",
  hold:"7 days",
  user: michael
)

Product.create!(
  food_type: "Lettuce",
  quantity: 7,
  marketer: "Whole Foods",
  description: "Blemished produce that could be better use for a farm",
  hold:"5 days",
  user: alice
)

Product.create!(
  food_type: "Tomatoes",
  quantity: 3,
  marketer: "Farm Fresh Co.",
  description: "Blemished produce that could be better use for a farm",
  hold:"2 days",
  user: buster
)

Product.create!(
  food_type: "Carrots",
  quantity: 4,
  marketer: "Green Thumb Inc.",
  description: "Blemished produce that could be better use for a farm",
  hold:"6 days",
  user: quinn
)

Product.create!(
  food_type: "Apples",
  quantity: 5,
  marketer: "Kroger Inc",
  description: "Blemished produce that could be better use for a farm",
  hold:"5 days",
  user: bob
)

Product.create!(
  food_type: "Lettuce",
  quantity: 5,
  marketer: "Walmart",
  description: "Blemished produce that could be better use for a farm",
  hold:"2 days",
  user: michael
)

message1 = Message.create(sender: bob, receiver: alice, content: 'Hello Alice!', read: false)
message2 = Message.create(sender: bob, receiver: alice, content: 'Did you receive my message?', read: false)

UserNotification.create(user: alice, message: message1, read: false)
UserNotification.create(user: alice, message: message2, read: false)
