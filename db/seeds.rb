# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'openfoodfacts'

OrderList.destroy_all
Order.destroy_all
Item.destroy_all
IngredientList.destroy_all
Ingredient.destroy_all
User.destroy_all

colin = User.new({
  username: 'colinmalin',
  first_name: 'Colin',
  last_name: 'Schmidt',
  email: 'colin.schmidt@gmail.com',
  password: 'Picasso96*'
})

colin.save

alex = User.new({
  username: 'alexflex',
  first_name: 'Alexandre',
  last_name: 'Stutz',
  email: 'alex04@gmail.com',
  password: 'Picasso96*'
})

alex.save

hadrien = User.new({
  username: 'hadri96',
  first_name: 'Hadrien',
  last_name: 'Morand',
  email: 'hadrienmorand@hotmail.com',
  password: 'Picasso96*'
})

hadrien.save

5.times do
  item = Item.new({
    name: Faker::Beer.unique.brand,
    item_price: (5..7).to_a.sample,
    category: 'beer',
    picture_url: 'https://marketingweek.imgix.net/content/uploads/2019/04/12174523/Carlsberg-pilsner.png'
  })
  item.save!
end

['Coca-cola', 'Sprite', 'Henniez verte', 'Henniez bleue', 'Urban Kombucha'].each do |drink|
  item = Item.new({
    name: drink,
    item_price: (5..7).to_a.sample,
    category: 'soft',
    picture_url: 'https://i2.wp.com/www.circularonline.co.uk/wp-content/uploads/2019/11/cocacola.png'
  })
  item.save!
end

['Pinot Noir - Orlaya', 'Petite Arvine - Christophe Abbet', 'Nez Noir - Provins', 'Altesse - les Parcelles', 'Chasselas - Domaine Bovet'].each do |wine|
  item = Item.new({
    name: wine,
    item_price: (5..7).to_a.sample,
    category: 'wine',
    picture_url: 'https://www.wineroo.ch/wp-content/uploads/2020/05/Pinot-Noir-Cave-De-L%E2%80%99Orlaya-Mathilde-Roux-Fully-2017-75-cl_Fully_6939_1.jpeg'
  })
  item.save!
end

5.times do
  item = Item.new({
    name: Faker::Food.unique.dish,
    item_price: (15..25).to_a.sample,
    category: 'food',
    picture_url: 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https://static.onecms.io/wp-content/uploads/sites/9/2017/06/stacked-gochujang-burger-fwx.jpg'
  })
  item.save!
end

