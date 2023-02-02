module AttrReader
  def attr_reader(*attributes)
    attributes.each do |attribute|
      define_method(attribute) do
        p 'bla-bla'
        instance_variable_get("@#{attribute}")
      end
    end
  end
end

class ExampleClass
  extend AttrReader

  attr_reader :attribute1, :attribute2

  def initialize(attribute1, attribute2)
    @attribute1 = attribute1
    @attribute2 = attribute2
  end
end

a = ExampleClass.new(:a, :b)