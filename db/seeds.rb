# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

auto = Category.create(name: "Automotive")
food = Category.create(name: "Food & Wine")
tech = Category.create(name: "Technology")

user = User.create(name: "Roger", email: "roger@gmail.com", password: "password", name: "Roger Dodger")

# 20.times do
#   Post.create(body: "Seed post", user_id: 1, category_id: rand(1..3) )
# end
