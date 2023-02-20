# frozen_string_literal: true

# отсортировать массив чисел. Запрещено использовать встроенные функции sort, sort!, sort_by и им подобные

arr = 100.times.map { Random.rand(-100..100) }

def sort(arr)
  size = arr.size

  while size != 0
    (0..size).each do |index|
      arr[index + 1], arr[index] = arr[index], arr[index + 1] if arr[index + 1] && arr[index] > arr[index + 1]
    end

    size -= 1
  end
  arr
end

p sort(arr)
