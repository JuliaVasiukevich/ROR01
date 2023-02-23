# frozen_string_literal: true

# 1) Реализуйте класс Student (Студент), который будет наследовать от класса User, подобно тому, как это сделано в теоретической части урока. Этот класс должен иметь следующие свойства: name (имя, наследуется от User), surname (фамилия, наследуется от User), year (год поступления в вуз). Класс должен иметь метод full name() (наследуется от User), с помощью которого можно вывести одновременно имя и фамилию студента. Также класс должен иметь метод course(), который будет выводить текущий курс студента (от 1 до 5). Курс вычисляется так: нужно от текущего года отнять год поступления в вуз. Текущий год получите самостоятельно.

class User
  def initialize(options = {})
    @name = options[:name]
    @surname = options[:surname]
  end

  def full_name
    p "#{@name} #{@surname}"
  end

  attr_accessor :surname, :name
end

class Student < User
  def initialize(options)
    @year = options[:year]
    super
  end

  def course
    time = Time.new
    course = time.year - @year
    if (1..5).include?(course)
      p course
    else
      p 'Not a student'
    end
  end

  attr_accessor :year
end

alex = Student.new({ name: 'Alex', surname: 'Green', year: 2018 })
alex.full_name
alex.course
