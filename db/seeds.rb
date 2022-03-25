# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p1 = Post.create(title: "Learning models all over again!", content: "Is there anything really new though??")
p2 = Post.create(title: "Learning routing in a different way!", content: "Routing is completely different in Rails!")

# Comment.create(rating: 1, content: "What a boring topic!!!", post: p1)
p1.comments.create(rating: 1, content: "What a boring topic!!!")
p1.comments.create(rating: 5, content: "What a great topic!!!")
p2.comments.create(rating: 3.5, content: "What an okay topic!!!")