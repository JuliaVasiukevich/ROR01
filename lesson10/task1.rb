# frozen_string_literal: true

# 1) Написать программу, которая проверяет что подаётся на ввод.
# Если подаётся что-то вместо числа - вызывать исключение и в обработке вывести, что было подано.

def number?
  p 'enter string that contain string or number'
  str = gets.strip
  begin
    raise ArgumentError unless str.match(/^-?\d*([.,]\d+)?$/)
    true
  rescue ArgumentError
    "False. It's not a number #{str}"
  end
end

p number?
