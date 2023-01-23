# По диаграмме (из слайда №6 ) классов создать иерархию. Реализовать все принципы ООП

class Mammal
   attr_reader :num_legs, :has_hair
   def initialize (num_legs, has_hair)
      @num_legs = num_legs
      @has_hair = has_hair
   end

   def saying
      puts ''
   end
end

class Cat < Mammal
   def initialize
      super(4, true)
   end

   def saying
      puts 'meaw'
   end
end

class Dog < Mammal
   def initialize(color_hair = '')
      @color_hair = color_hair
      super(4, true)
   end

   def saying
      puts 'gav'
   end

   def show_color
      puts @color_hair
   end
end

class Horse < Mammal
   def initialize(color_hair = '')
      @color_hair = color_hair
      super(4, true)
   end

   def saying
      puts 'igogo'
   end

   def show_color
      puts @color_hair
   end
end

class Elepfant < Mammal
   def initialize
      super(4, false)
   end

   def saying
      puts 'eeeee'
   end
end

class GermanStephield < Dog
   def initialize
      super('brown')
   end

end

class LabladorRetrivier < Dog

   def initialize
      super('golden')
   end
end

class Cludesdale < Horse
   def initialize
      super('brown')
   end
end

class Palomino < Horse
   def initialize
      super('white')
   end
end

g = GermanStephield.new
g.show_color