# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'Shivani Alya', gender: "Female", phoneNumber: 8871379123, dateBirth: "22/09/1996", admin: true, email: 'shivani@test.com', password: 'password')