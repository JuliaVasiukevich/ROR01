def put_coefficient(coefficient, coefficients)
  key = coefficient[0]
  while coefficients[key].nil?
    p "Введите коэффициент #{key}:"
    coefficients[key] = gets.strip.scan(/-?\d+/).join
    coefficients[key] = coefficients[key].to_f if coefficients[key]
  end
end

coefficients = {
  a: nil,
  b: nil,
  c: nil
}

puts 'Для решения квадратного уравнения требуется ввести коэффициенты a, b, c'

coefficients.map do |coefficient|
  put_coefficient(coefficient, coefficients)
end

d = coefficients[:b]**2 - 4 * coefficients[:a] * coefficients[:c]

if d < 0
  p "D = #{d}."
  p 'Корней нет.'
elsif d == 0 && coefficients[:a] != 0
  p "D = #{d}."
  p "x = #{- coefficients[:b] / (2 * coefficients[:a])}."
elsif d > 0 && coefficients[:a] != 0
  p "D = #{d}."
  p "x1 = #{(- coefficients[:b] + Math.sqrt(d)) / (2 * coefficients[:a])}."
  p "x2 = #{(- coefficients[:b] - Math.sqrt(d)) / (2 * coefficients[:a])}."
else
  p 'Не является квадратным уравнением!'
  p "x = #{-coefficients[:c] / coefficients[:b]}"
end
