# Реализуйте иерархию классов Figure, Circle, Square, Rectangle, Triangle с методами area() и perimeter(), которые возвращают площадь и периметр фигуры. Используйте полиморфизм. 

class Figure
  def area
    0
  end

  def perimeter
    0
  end
end

class Rectangle < Figure
  def initialize(side1, side2)
    @sides = [side1, side2]
  end

  def area
    p @sides.reduce(&:*)
  end

  def perimeter
    p @sides.sum * 2
  end
end

class Square < Figure
  def initialize(side)
    @side = side
  end

  def area
    p @side ** 2
  end

  def perimeter
    p @side * 4
  end
end

class Triangle < Figure
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def area
    half_perimeter = perimeter / 2.0
    p Math.sqrt(half_perimeter * (half_perimeter - @sides[0]) * (half_perimeter - @sides[1]) * (half_perimeter - @sides[2]))
  end

  def perimeter
    p @sides.sum
  end
end

class Circle < Figure
  def initialize(radius)
    @radius = radius
  end

  def area
    p Math::PI * (@radius ** 2)
  end

  def perimeter
    p 2 * Math::PI * @radius
  end
end

rectangle = Rectangle.new(2,3)
rectangle.area
rectangle.perimeter

square = Square.new(3)
square.area
square.perimeter

triangle = Triangle.new(3,4,5)
triangle.area
triangle.perimeter

circle = Circle.new(3)
circle.area
circle.perimeter
