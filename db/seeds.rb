# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all

user1 = User.create({username: "nathanriemer", password: "password", email: "nathan.riemer@gmail.com", is_admin: true, city: "New York", state: "NY", country: "USA"})
user2 = User.create({username: "someoneelse", password: "password", email: "fake@gmail.com"})

a1 = Article.create({title: "Dogs"})
a2 = Article.create({title: "Running"})
a3 = Article.create(title: "Welcome")

r1 = Revision.create({content: "Dogs are really great", user: user1, article: a1})
r2 = Revision.create({content: "Dogs are *extremely* great", user: user1, article: a1})