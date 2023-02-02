# 1) Создать класс Товар, имеющий переменные имя, цена, рейтинг. 
# 2) Создать класс Категория, имеющий переменные имя и массив товаров. Создать несколько объектов класса Категория. 
# 3) Создать класс Basket, содержащий массив купленных товаров. 
# 4) Создать класс User, содержащий логин, пароль и объект класса Basket. Создать несколько объектов класса User.
#   5) Вывести на консоль каталог продуктов.
#   6) Вывести на консоль покупки посетителей магазина.

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
  def initialize(name, array_of_products)
    @name_of_category = name
    @array_of_products = array_of_products
  end

  def show_all_category
    p "#{@name_of_category}:"
    @array_of_products.map(&:show_details)
    puts
  end
end

class Basket
  def initialize(array_of_products)
    @array_of_products = array_of_products
  end

  def show_all_basket
    @array_of_products.map(&:show_details)
  end
end

class User
  def initialize(login, password, basket)
    @login = login
    @password = password
    @basket = Basket.new(basket)
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

grocery = Category.new('grocery', [tea, coffee])
dairy = Category.new('dairy', [milk, butter])

alex = User.new('alex', '12345Aa', [tea, milk])
oleg = User.new('oleg', 'qwerty123', [coffee])
vova = User.new('vova', '124587', [butter])

[grocery, dairy].map(&:show_all_category)
[alex, oleg, vova].map(&:show_basket)
