user_cart = {}

def add_product(user_cart, product, price, count)
  user_cart[product] = { price: price,
                         count: count }
end

def is_product?(word)
  word.downcase != 'стоп'
end

def input_price
  p 'Введите цену товара:'
  price = gets.strip.to_f
  if price <= 0
    p 'Неверно! Цена должна быть больше 0.'
    input_price
  else
    price
  end
end

def input_count
  p 'Введите количество товара:'
  count = gets.strip.to_f
  if count <= 0
    p 'Неверно! Количество должно быть больше 0.'
    input_count
  else
    count
  end
end

def check_above_zero(number, method)
  if number <= 0
    p 'Неверно! Число должно быть больше 0.'
    method
  else
    number
  end
end

loop do
  p "Введите название товара или 'стоп', чтобы прекратить покупки"
  product = gets.strip.capitalize

  break unless is_product?(product)

  if user_cart[product]
    p 'Такой товар уже существует! Вам следует добавить только количество!'
    price = user_cart[product][:price]
    count = user_cart[product][:count] + input_count
  else
    price = input_price
    count = input_count
  end

  add_product(user_cart, product, price, count)
end
p user_cart
user_summ = user_cart.values.map { |value| value[:price] * value[:count] }.sum
p "Товаров в корзине на сумму: #{user_summ}"
