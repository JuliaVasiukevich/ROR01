MIN = 10
MAX = 100
STEP = 5
array = []
number = MIN

while number <= MAX
  if number % STEP == 0
    array << number
    number += STEP
  else
    number += 1
  end
end

p array
