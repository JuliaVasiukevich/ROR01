# 1) Написать программу, которая проверяет что подаётся на ввод. Если подаётся что-то вместо числа - вызывать исключение и в обработке вывести, что было подано.

def is_number?
  p 'enter string that contain string or number'
  str = gets.strip
  begin
    true if Float(str)
  rescue ArgumentError
    "False. It's not a number #{str}"
  end
end

p is_number?