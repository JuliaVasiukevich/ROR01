# 1. компьютер загадывает число
# 2. просим пользователя угадать число (рассказать пользователю про правила игры)
# 3. проверяем угадал ли и чуть что подсказываем
# 4. обновляем количество попыток

MIN = 0
MAX = 100
MAX_TRIES = 7
INPUT_EQUEL = 'Вы выиграли!'
INPUT_LOWER = 'Ваше число меньше загаданного!'
INPUT_HIGER = 'Ваше число больше загаданного!'

def right_guess?(users_guess, secret_number)
  if users_guess == secret_number
    return INPUT_EQUEL
  elsif users_guess < secret_number
    return INPUT_LOWER
  elsif users_guess > secret_number
    return INPUT_HIGER
  end
end

secret_number = rand(MIN..MAX)
current_guess = (MAX + MIN) / 2
min_number = MIN
max_number = MAX

loop do
  guess_result = right_guess?(current_guess, secret_number)
  
  if guess_result == INPUT_EQUEL
    puts 'Победа!'
    break
  elsif guess_result == INPUT_LOWER
    min_number = current_guess
  elsif guess_result == INPUT_HIGER
    max_number = current_guess
  end
  current_guess = (min_number + max_number) / 2
end
