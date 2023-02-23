# frozen_string_literal: true

# Заполнить массив числами фибоначчи до 100

MAX = 100
array_fibonacci = [1, 1]
index = 1

loop do
  number = array_fibonacci[index] + array_fibonacci[index - 1]
  break if number > 100

  array_fibonacci << number
  index += 1
end

p array_fibonacci
