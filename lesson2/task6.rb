# frozen_string_literal: true

colors = {
  red: { title: 'красный',
         keyboard_value: 'к',
         generate_value: 1..45,
         coefficient: 2 },
  black: { title: 'черный',
           keyboard_value: 'ч',
           generate_value: 46..90,
           coefficient: 2 },
  green: { title: 'зеленый',
           keyboard_value: 'з',
           coefficient: 36,
           generate_value: 91...100 }
}

user_account = {
  account: 100,
  bet: 0
}

game_statistic = {
  user_bet: nil,
  roulet_bet: nil
}

game = true
round = 0

def make_bet(user_account)
  p 'Сделайте ставку в монетах!(Пишите только число, иначе ставка превратиться в тыкву!)'
  user_account[:bet] = gets.strip.to_i

  if (user_account[:account] - user_account[:bet]).negative?
    p 'На вашем счету недостаточно монет!'
    make_bet(user_account)
  else
    user_account[:account] -= user_account[:bet]
    p "Вы поставили #{user_account[:bet]} монет, остаток: #{user_account[:account]}"
  end
end

def generate_color(colors, user_account, game_statistic)
  value = rand(1...100)
  key = colors.find { |color| color[1][:generate_value].include?(value) }[0]
  game_statistic[:roulet_bet] = key
  p "Выпал #{colors[key][:title]} цвет!"
  show_results(colors, key, user_account, game_statistic)
end

def activate_user_bet(colors, game_statistic)
  p 'На какой цвет поставите? к - красный, ч - черный, з - зеленый'
  value = gets.strip
  key = colors.find { |color| color[1][:keyboard_value] == value }
  if key
    key = key[0]
    p "Вы поставили на #{colors[key][:title]} цвет!"
    game_statistic[:user_bet] = key
  else
    activate_user_bet(colors, game_statistic)
  end
end

def show_results(colors, key, user_account, game_statistic)
  if game_statistic[:roulet_bet] == game_statistic[:user_bet]
    show_win_results(colors, key, user_account)
  else
    show_lose_results
  end
end

def show_win_results(colors, key, user_account)
  win_account = user_account[:bet] * colors[key][:coefficient]
  user_account[:account] += win_account
  p "Поздравляем! Вы выиграли! Ваш выигрыш составил #{win_account} монет"
end

def show_lose_results
  p 'О нет! Вы проиграли!'
end

def continue_game?(user_account)
  user_account[:account] != 0
end

p 'Добро пожаловать!'

while game
  p "У Вас есть #{user_account[:account]} монет. Давайте сыграем раунд в рулетку! (д/н)"
  answer = gets.strip
  if answer.downcase == 'д'
    round += 1
    p "Раунд ##{round}"
    activate_user_bet(colors, game_statistic)
    make_bet(user_account)
    generate_color(colors, user_account, game_statistic)
    game = continue_game?(user_account)
    p 'Вы проиграли все :(' unless game
  elsif answer.downcase == 'н'
    p "Поздравляем! Вы уходите домой с количеством монет: #{user_account[:account]}!"
    game = false
  else
    p 'Некорректные данные'
  end
end

p 'Приходите еще!'
