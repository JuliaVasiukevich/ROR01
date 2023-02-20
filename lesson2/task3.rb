# frozen_string_literal: true

def correct_data(parameter)
  p "Введите корректное значение для #{parameter[:title]}"
  parameter[:value] = gets.strip.to_f
end

triangle_parameters = {
  base: { value: 0,
          title: 'основания' },
  height: { value: 0,
            title: 'высоты' }
}

puts 'Введите основание и высоту треугольника, чтобы посчитать его площадь:'
triangle_parameters[:base][:value] = gets.strip.to_f
triangle_parameters[:height][:value] = gets.strip.to_f

while triangle_parameters[:base][:value] <= 0 || triangle_parameters[:height][:value] <= 0
  parameter = triangle_parameters[:base][:value] <= 0 ? triangle_parameters[:base] : triangle_parameters[:height]
  correct_data(parameter)
end

square = triangle_parameters[:base][:value] * triangle_parameters[:height][:value] / 2

puts "Площадь треугольника = #{square}"
