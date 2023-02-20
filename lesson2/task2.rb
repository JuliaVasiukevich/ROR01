# frozen_string_literal: true

def input_name(try)
  puts 'Неверно!' if try.positive?
  puts 'Введите Ваше имя:'
  gets.strip.capitalize
end

def input_growth(try)
  puts 'Неверно!' if try.positive?
  puts 'Введите ваш рост:'
  gets.strip.to_f
end

try = 0
user_name = ''

while user_name.empty?
  user_name = input_name(try)
  try += 1
end

user_growth = 0
try = 0

while user_growth <= 0
  user_growth = input_growth(try)
  try += 1
end

user_weight = (user_growth - 110) * 1.15

if user_weight.positive?
  puts "#{user_name}, Ваш идеальный вес #{user_weight}"
else
  puts 'Ваш вес уже оптимальный'
end
