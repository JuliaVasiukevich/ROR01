require 'json'
require 'curb'

categories_request = Curl.get("https://api.chucknorris.io/jokes/categories")
categories = JSON.parse(categories_request.body)

categories.map.with_index do |element, index|
  p "#{index + 1}: #{element}"
end

p 'Chose number of category'
number_of_category = gets.strip.to_i - 1
chosen_category = categories[number_of_category]

p "Your category is #{chosen_category}"

joke_request = Curl.get("https://api.chucknorris.io/jokes/random?category=#{chosen_category}")

p JSON.parse(joke_request.body)['value']