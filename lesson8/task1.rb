# 1. Создать класс Animal и расширяющие его классы Dog, Cat, Horse. Класс Animal должен содержать переменную класса, отвечающую за количество созданных объектов. Также у него должен быть метод класса, выводящий это количество
# 2. Класс Animal содержит переменные food, location и методы makeNoise, eat, sleep. Метод makeNoise, например, может выводить на консоль "Такое-то животное спит". 
# 3. Dog, Cat, Horse переопределяют методы makeNoise, eat. 
# 4. Добавьте переменные в классы Dog, Cat, Horse, характеризующие только этих животных.
#   5. Создайте класс Ветеринар, в котором определите метод treatAnimal(animal). Пусть этот метод распечатывает food и location пришедшего на прием животного.
#   6. Создайте массив различных животных, в который запишите животных всех имеющихся у вас типов. В цикле отправляйте их на прием к ветеринару. Выведите их количество

class Animal
  @@count = 0
  attr_reader :food, :location

  def initialize(food, location)
    @@count += 1
    @food = food
    @location = location
  end

  def show_count
    p @@count
  end

  def makeNoise
    p "#{self.class} make noise"
  end

  def eat
    p "#{self.class} eat #{self.food}"
  end

  def sleep
    p "#{self.class} sleep in the #{self.location}"
  end

  def properties
    p "love dogs: #{@love_dogs}, love cats: #{@love_cats}, love_human: #{@love_human}"
  end
end

class Cat < Animal

  def initialize(food, location)
    @love_dogs = false
    @love_cats = false
    @love_human = false
    super
  end

  def makeNoise
    p "#{self.class} make meaw"
  end

end

class Dog < Animal
  def initialize(food, location)
    @love_dogs = true
    @love_cats = false
    @love_human = true
    super
  end

  def makeNoise
    p "#{self.class} make gav"
  end
end

class Horse < Animal
  def initialize(food, location)
    @love_dogs = true
    @love_cats = true
    @love_human = true
    super
  end

  def makeNoise
    p "#{self.class} make igo-go"
  end
end

class Vet

  def treatAnimal(animal)
    @count_vet_animals = @count_vet_animals ? @count_vet_animals + 1 : 1
    p " An animal has come to vet that eats #{animal.food} and lives in the #{animal.location}"
  end

  def show_count_of_vet_aniamls
    p "Count of vet animals: #{@count_vet_animals}"
  end

end

a = Animal.new('food', 'location')
b = Cat.new('fish', 'home')
d = Dog.new('meat', 'home')
c = Horse.new('carrot', 'stable')
c.show_count
c.makeNoise
c.eat
c.properties

v = Vet.new
v.treatAnimal(d)

[b,c,d,a].map{|animal| v.treatAnimal(animal)}
v.show_count_of_vet_aniamls

