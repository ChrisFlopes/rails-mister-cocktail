require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

puts '🌬 Cleaning Ingredients database...'
Ingredient.destroy_all

puts '🧙🏻‍♂️ Creating ingredients...'
ingredients_attributes = []

user['drinks'].each do |ingredient|
  ingredients_attributes.sort << { name: ingredient['strIngredient1'] }
end
Ingredient.create!(ingredients_attributes)
puts '👍🏻 Finished!'
