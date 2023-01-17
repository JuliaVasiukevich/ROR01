# 2) Николаю требуется проверить, возможно ли из представленных отрезков условной длины сформировать треугольник. Для этого он решил создать класс TriangleChecker, принимающий только положительные числа. С помощью метода is triangle() возвращаются следующие значения (в зависимости от ситуации):
#   – Ура, можно построить треугольник!;
# – С отрицательными числами ничего не выйдет!;
# – Нужно вводить только числа!;
# – Жаль, но из этого треугольник не сделать.

class TriangleChecker
  def initialize(side1,side2,side3)
    @sides = [side1, side2, side3]
  end

  def is_triangle
    if !@sides.select {|side| side.class == String}.empty?
      p 'Нужно вводить только числа!'
    elsif !@sides.select {|side| side < 0}.empty?
      p 'С отрицательными числами ничего не выйдет!'
    else
      sorted_sides = @sides.sort
      if sorted_sides[0] + sorted_sides[1] > sorted_sides[2]
        p 'Ура, можно построить треугольник!'
      else
        p 'Жаль, но из этого треугольник не сделать.'
      end
    end
  end
end

p = TriangleChecker.new(5,4,3)
p.is_triangle