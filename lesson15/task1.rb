require 'json'
require 'curb'

res = Curl.get("https://api.chucknorris.io/jokes/categories")
puts res.body
