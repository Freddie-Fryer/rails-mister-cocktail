# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

file = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
ingredients_hash = JSON.parse(file.read)
ingredients_hash['drinks'].each do |i|
  ingredient = Ingredient.create(name: i['strIngredient1'])
end

48.times do
  Cocktail.create(name: Faker::FunnyName.two_word_name)
end

# Update seed file (3x cocktails)
# test seed
# test it first
# push to git
# push to heroku
# heroku run rake db:seed
