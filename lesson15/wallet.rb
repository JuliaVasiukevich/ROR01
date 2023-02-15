class Wallet

  attr_reader :balance

  def initialize(id)
    @id = id
    @balance = find_wallet
  end

  def find_wallet
    File.open("wallets.txt") do |file|
      file.each_line do |line|
        id, money = line.strip.split(",")
        @balance = money if id == @id
      end
    end

    if @balance == nil
      File.open("wallets.txt", "a") do |file|
        file.puts "#{@id},0"
      end
      @balance = 0
    end

    balance.to_f
  end

  def replenish_the_balance
    p 'How much do you want to replenish the balance?'
    money = gets.strip.to_f

    change_balance('plus', money)
  end

  def change_balance(operation, summ)
    if operation == 'plus'
      @balance += summ
    elsif operation == 'minus'
      if @balance - summ > 0
        @balance -= summ
      else
        p 'You don`t have enougth money :('
      end

      File.open("wallets.txt", "r+") do |file|
        lines = file.readlines
        lines[@id.to_i - 1] = "#{@id},#{@balance}"
        file.rewind
        file.truncate(0)
        file.puts(lines)
      end
    end
  end
end
