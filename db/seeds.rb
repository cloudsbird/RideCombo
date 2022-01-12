# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Item.create(code: 'MUG', name: 'Reedsy Mug', price: '6.00')
Item.create(code: 'TSHIRT', name: 'Reedsy T-shirt', price: '15.00')
Item.create(code: 'HOODIE', name: 'Reedsy Hoodie', price: '20.00')


Discount.create(type: 'each_percentage', value: '30', item_code: 'TSHIRT', min_items: '3')
Discount.create(type: 'item', value: 1, item_code: 'MUG', min_items: '1')
