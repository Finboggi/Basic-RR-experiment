# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


shop = Shop.create(name: 'Ulmart', url: 'https://www.ulmart.ru/')

product = Product.create(name: 'Квадрокоптер DJI SPARK Lava Red')
product.links.create(url: 'https://www.ulmart.ru/goods/4348814', shop: shop)

product = Product.create(name: 'Квадрокоптер радиоуправляемый MJX Bugs-3')
product.links.create(url: 'https://www.ulmart.ru/goods/4267032', shop: shop)

