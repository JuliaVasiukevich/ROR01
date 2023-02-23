# frozen_string_literal: true

# в строке могут быть скобки 3 видов (), {}, []. Ваша программа должна возвращать true если расстановка скобок верная и false в противном случае

def valid?(str)
  stack = []
  brackets = {
    '}' => '{',
    ')' => '(',
    ']' => '['
  }

  str.each_char do |bracket|
    if brackets.values.include? bracket
      stack.push(bracket)
    else
      return false unless stack[-1] == brackets[bracket]

      stack.pop
    end
  end

  stack.empty?
end

str = '{'
p valid?(str)
