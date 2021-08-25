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

[['Bud Light', "bud-light.jpg"], ['Stella Artois', "stella-artois.jpg"], ['Becks', "becks.jpg"], ['Kirin', "kirin.jpg"], ['Tsingtao', "tsingtao.jpg"]].each do |mini_array|
  item = Item.new({
    name: mini_array[0],
    item_price: (5..7).to_a.sample,
    category: 'beer',
  })
  file = File.open("app/assets/images/#{mini_array[1]}")
  item.photo.attach(io: file, filename: mini_array[1], content_type: 'image/jpeg')
  item.save!

end

[['Coca-cola', "coca-cola.jpg"], ['Sprite', "sprite.jpg"], ['Henniez verte', "henniez-verte.jpg"], ['Henniez bleue', "henniez-bleu.jpg"], ['Urban Kombucha', "urban-kambucha.jpg"]].each do |mini_array|
  item = Item.new({
    name: mini_array[0],
    item_price: (4..6).to_a.sample,
    category: 'soft',
  })
  file = File.open("app/assets/images/#{mini_array[1]}")
  item.photo.attach(io: file, filename: mini_array[1], content_type: 'image/jpeg')
  item.save!

end

[['Pinot Noir - Orlaya', "pinot-noir-orlaya.jpg"], ['Petite Arvine - Christophe Abbet', "petite-arvine-christophe-abbet.jpg"], ['Nez Noir - Provins', "nez-noir-provin.jpg"], ['Altesse - les Parcelles', "altesse-les-parcelles.jpg"], ['Chasselas - Domaine Bovet', "chasselas-domaine-bovet.jpg"]].each do |mini_array|
  item = Item.new({
    name: mini_array[0],
    item_price: (15..50).to_a.sample,
    category: 'wine',
  })
  file = File.open("app/assets/images/#{mini_array[1]}")
  item.photo.attach(io: file, filename: mini_array[1], content_type: 'image/jpeg')
  item.save!

end

[['French Toast', "french-toast.jpg"], ['Bruschette with tomato', "bruschette-with-tomato.jpg"], ['Pappardelle alla bolognese', "papardelle-alla-bolognese.jpg"], ['Peking Duck', "peking-duck.jpg"], ['Stinky Tofu', "stinky-tofu.jpg"]].each do |mini_array|
  item = Item.new({
    name: mini_array[0],
    item_price: (11..27).to_a.sample,
    category: 'food',
  })
  file = File.open("app/assets/images/#{mini_array[1]}")
  item.photo.attach(io: file, filename: mini_array[1], content_type: 'image/jpeg')
  item.save!

end
