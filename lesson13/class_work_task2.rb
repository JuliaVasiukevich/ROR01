module AttrReaderCustom
  def attr_reader_custom(*attributes)
    attributes.each do |attribute|
      define_method(attribute) do
        p 'bla-bla'
        instance_variable_get("@#{attribute}")
      end
    end
  end
end

class ExampleClass
  extend AttrReaderCustom

  attr_reader_custom :attribute1, :attribute2

  def initialize(attribute1, attribute2)
    @attribute1 = attribute1
    @attribute2 = attribute2
  end
end

a = ExampleClass.new('18', '13')
a.attribute1