class DynamicMethods

  attr_reader :hash
  def initialize(hash)
    @hash = hash
    create_types(hash)
  end
  def create_types(hash)
    hash.each do |key, value|
      define_singleton_method "#{key}" do
        value
      end
    end
  end
end

my_hash = { name: 'Vasya', surname: 'Pupkin', age: '18'}

a = DynamicMethods.new(my_hash)

p a.name