# 1. взять api https://api.chucknorris.io/
# 2. надо написать программу, которая будет позволять пользователю выбирать из доступных категорий и будет возвращать пользователю случайную шутку из этой категории

require 'json'
require 'curb'

class JokesGenerator

  HOST = 'https://api.chucknorris.io'
  CATEGORY_PATH = '/jokes/categories'
  JOKE_BY_CATEGORY = '/jokes/random?category='

  def initialize
    @categories = nil
  end

  class << self
    def category_request
      categories_request = Curl.get(HOST + CATEGORY_PATH)
      @categories = JSON.parse(categories_request.body)

      @categories.map.with_index do |element, index|
        p "#{index + 1}: #{element}"
      end

      chose_category
    end

    def chose_category
      p 'Chose number of category'
      number_of_category = gets.strip.to_i - 1

      raise StandardError 'Unknown value!' unless (1..@categories.size).include? number_of_category

      chosen_category = @categories[number_of_category]
      p "Your category is #{chosen_category}"

      joke_request(chosen_category)
    end

    def joke_request(chosen_category)
      joke_request = Curl.get(HOST + JOKE_BY_CATEGORY + chosen_category)
      p JSON.parse(joke_request.body)['value']
    end
  end
end

loop do
  JokesGenerator.category_request

  p 'press any button to continue...'
  gets
end