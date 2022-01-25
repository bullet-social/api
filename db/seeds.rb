# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create admin
User.create({
	name: "Callan Goldeneye",
	username: "callan",
	email: "c.goldeneye@protonmail.com",
	password_digest: "$2a$12$hIFU6OtS.4UvDASffOS36u1xiQBFHfl1KtqAzIqAmMnGYYdt4QgxC",
	admin: true
})
