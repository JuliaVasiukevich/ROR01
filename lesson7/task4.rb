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
   def initialize
      super(4, true)
   end

   def saying
      puts 'gav'
   end
end

class Horse < Mammal
   def initialize
      super(4, true)
   end

   def saying
      puts 'igogo'
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
end

class LabladorRetrivier < Dog
end

class Cludesdale < Horse
end

class Palomino < Horse
end