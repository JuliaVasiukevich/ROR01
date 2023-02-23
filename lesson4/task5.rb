# frozen_string_literal: true

# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

vowels = %w[a e i o u y]
hash_vowels = {}

vowels.map do |vowel|
  hash_vowels[vowel] = vowel.ord - 96
end

p hash_vowels
