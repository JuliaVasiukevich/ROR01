# frozen_string_literal: true

# Проверка логина и пароля
# Создать метод который принимает на вход три параметра: login, password и confirm_password.
#   Login должен содержать только латинские буквы, цифры и знак подчеркивания.
#   Длина login должна быть меньше 20 символов. Если login не соответствует этим требованиям,
# необходимо выбросить WrongLoginException.
#   Password должен содержать только латинские буквы, цифры и знак подчеркивания.
# Длина password должна быть меньше 20 символов.
# Также password и confirm _password должны быть равны.
# Если password не соответствует этим требованиям, необходимо выбросить WrongPasswordException.
#   WrongPasswordException и WrongLoginException - пользовательские классы исключения с двумя конструкторами
# – один по умолчанию, второй принимает сообщение исключения и передает его в конструктор класса Exception.
#   Обработка исключений проводится внутри метода.
#     Метод возвращает true, если значения верны или false в другом случае.

# WrongPasswordException is raised when a user enters an incorrect password.
class WrongPasswordException < StandardError
  def initialize(message = 'Invalid password')
    super(message)
  end
end

# WrongLoginException is raised when a user enters an incorrect login.
class WrongLoginException < StandardError
  def initialize(message = 'Wrong login')
    super(message)
  end
end

def create_account(login, password, confirm_password)
  raise WrongLoginException unless login.size < 20 && login.match(/^[a-zA-Z0-9_]+$/)
  unless password.size < 20 && password.match(/^[a-zA-Z0-9_]+$/) && password == confirm_password
    raise WrongPasswordException
  end

  true
rescue WrongLoginException, WrongPasswordException => e
  p e.message
  false
end

p create_account('usdvnlkvn!', 'password', 'password')
