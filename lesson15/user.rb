require_relative 'movies'
class User
  attr_accessor :name, :password, :id

  def initialize(id, login, password)
    @id = id
    @name = login
    @password = password
  end

end