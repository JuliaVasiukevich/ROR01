# 1) Создать класс Car в модуле Vehicles, класс Engine в модуле Professions.
#   2) Класс Driver содержит поля - ФИО, стаж вождения.
#   3) Класс Engine содержит поля - мощность, производитель.
# 4) Класс Car содержит поля - марка автомобиля, класс автомобиля, вес, водитель типа Driver, мотор типа Engine. Методы start(), stop(), turnRight(), turnLeft(), которые выводят на печать: "Поехали", "Останавливаемся", "Поворот направо" или "Поворот налево". А также метод to s(), который выводит полную информацию об автомобиле, ее водителе и моторе. 
# 5) Создать производный от Car класс  - Lorry (грузовик), характеризуемый также грузоподъемностью кузова.
#   6) Создать производный от Car класс - SportCar, характеризуемый также предельной скоростью.
#   7) Пусть класс Driver расширяет класс Person.

module Vehicles
  class Car
    attr_reader :brand, :driver, :weight, :car_class, :engine
    def initialize(brand, car_class, weight, driver, engine)
      @brand = brand
      @car_class = car_class
      @weight = weight
      @driver = driver
      @engine = engine
    end

    def start
      if @moving
        p 'Автомобиль уже заведен'
      else
        @moving = true
        p 'Поехали'
      end
    end

    def stop
      if @moving
        @moving = false
        p 'Останавливаемся'
      else
        p 'Автомобиль еще не заведен'
      end
    end

    def turnRight
      p @moving ? 'Поворот направо' : 'Автомобиль не может двигаться. Давайте его заведем!'
    end

    def turnLeft
      p @moving ? 'Поворот налево' : 'Автомобиль не может двигаться. Давайте его заведем!'
    end

    def to_s
      print "Марка: #{@brand}. Класс: #{@car_class}. Вес: #{@weight}. Мотор #{@engine.manufacturer} #{@engine.power}. Водитель автомобиля: #{@driver.name}, опыт вождения: #{@driver.experience}"
      super
      puts
    end
  end
end

module Professions
  class Engine
    attr_reader :manufacturer, :power
    def initialize(power, manufacturer)
      @power = power
      @manufacturer = manufacturer
    end
  end
end

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Driver < Person
  attr_reader :experience
  def initialize(name, experience)
    @experience = experience
    super(name)
  end
end

class Lorry < Vehicles::Car
  prepend Vehicles

  attr_reader :body_load_capacity
  def initialize(brand, weight, driver, engine, body_load_capacity, car_class = 'грузовик')
    @body_load_capacity = body_load_capacity
    super(brand, car_class, weight, driver, engine)
  end

  def to_s
    super
    print "Грузоподъемность: #{@body_load_capacity}."
    puts
    puts
  end
end

class SportCar < Vehicles::Car
  prepend Vehicles

  def initialize(brand, weight, driver, engine, max_speed, car_class = 'спортивная машина')
    @max_speed = max_speed
    super(brand, car_class, weight, driver, engine)
  end

  def to_s
    super
    print "Максимальная скорость: #{@max_speed}."
    puts
    puts
  end
end

alexey = Driver.new('Иванов Алексей Юрьевич', '5 лет')
engine_bmv = Professions::Engine.new('106 л.с.', 'BMV')
peugeot307 = Vehicles::Car.new('Peugeot', 'хэтчбэк', '3.5т', alexey, engine_bmv)

peugeot307.turnRight
peugeot307.start
peugeot307.turnLeft
peugeot307.turnRight
peugeot307.stop
peugeot307.to_s

gazel = Lorry.new('Gazel', '8т', alexey, engine_bmv, '25т')
gazel.start
gazel.to_s

mazda = SportCar.new('Mazda', '1.5т', alexey, engine_bmv, '280км/ч')
mazda.to_s
