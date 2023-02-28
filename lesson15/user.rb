class User
  attr_accessor :name, :id

  def initialize(id, login)
    @id = id
    @name = login
  end

end