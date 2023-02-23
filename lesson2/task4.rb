# frozen_string_literal: true

def correct_data(parameter)
  p "Введите корректное значение для #{parameter[:title]}"
  parameter[:value] = gets.strip.to_f
end

triangle_sides = {
  side1: { value: 0,
           title: '1 стороны' },
  side2: { value: 0,
           title: '2 стороны' },
  side3: { value: 0,
           title: '3 стороны' }
}

puts 'Введите 3 строны треугольника, чтобы узнать вид прямоугольника:'
triangle_sides[:side1][:value] = gets.strip.to_f
triangle_sides[:side2][:value] = gets.strip.to_f
triangle_sides[:side3][:value] = gets.strip.to_f

while triangle_sides[:side1][:value] <= 0 || triangle_sides[:side2][:value] <= 0 || triangle_sides[:side3][:value] <= 0
  parameter = if triangle_sides[:side1][:value] <= 0
                triangle_sides[:side1]
              elsif triangle_sides[:side2][:value] <= 0
                triangle_sides[:side2]
              else
                triangle_sides[:side3]
              end
  correct_data(parameter)
end

side1, side2, side3 = [triangle_sides[:side1][:value], triangle_sides[:side2][:value], triangle_sides[:side3][:value]].sort

if side1 + side2 < side3
  puts 'Такой треугольник не существует'
else
  puts 'Равнобедренный' if side1 == side2 && side2 == side3
  puts 'Равносторонний' if side1 == side2 || side2 == side3
  puts 'Прямоугольный' if side1**2 + side2**2 == side3**2
end
