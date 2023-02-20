# frozen_string_literal: true

# Взять задание с темы ООП и переписать методы с использованием блоков, Proc и lambda

show_details = proc { |products| products.map(&:show_details) }

class Product
  attr_reader :rating, :price, :name

  def initialize(name, price, rating)
    @name = name
    @price = price.to_s
    @rating = rating.to_s
  end

  def show_details
    p "Name: #{@name}, price: #{@price}, rating: #{@rating}"
  end
end

class Category
  def initialize(name, products, show_details)
    @category = name
    @products = products
    @show_details = show_details
  end

  def show_all_category
    p "#{@category}:"
    @show_details.call(@products)
    puts
  end
end

class Basket
  def initialize(products, show_details)
    @products = products
    @show_details = show_details
  end

  def show_all_basket
    @show_details.call(@products)
  end
end

class User
  def initialize(login, password, basket, show_details)
    @login = login
    @password = password
    @basket = Basket.new(basket, show_details)
  end

  def show_basket
    p @login
    @basket.show_all_basket
    puts
  end
end

coffee = Product.new('Nescafe', 19.99, 4.5)
tea = Product.new('Tess', 5.54, 4.0)
milk = Product.new('Savushkin', 2.23, 5.0)
butter = Product.new('President', 8.93, 3.35)

grocery = Category.new('grocery', [tea, coffee], show_details)
dairy = Category.new('dairy', [milk, butter], show_details)

alex = User.new('alex', '12345Aa', [tea, milk], show_details)
oleg = User.new('oleg', 'qwerty123', [coffee], show_details)
vova = User.new('vova', '124587', [butter], show_details)

[grocery, dairy].map(&:show_all_category)
[alex, oleg, vova].map(&:show_basket)
