# 1) Создать класс Soda (для определения типа газировки), принимающий 1 аргумент при инициализации (отвечающий за добавку к выбираемому лимонаду). В этом классе реализуйте метод show my drink(), выводящий на печать «Газировка и {ДОБАВКА}» в случае наличия добавки, а иначе отобразится следующая фраза: «Обычная газировка».

class Soda
  def initialize(ingredient = '')
    @ingredient = ingredient
  end

  def show_my_drink
    unless @ingredient.empty?
      p("Газировка и #{@ingredient}")
    else
      p('Обычная газировка')
    end
  end
end

t = Soda.new()
t.show_my_drink