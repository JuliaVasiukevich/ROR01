require_relative 'autorizate'
require_relative 'cinema_engine'
class Controller

  SIGN_IN = 'i'
  SIGN_UP = 'u'
  PERSONAL_ACCOUNT = 'pa'
  TICKETS = 't'
  REPLENISH_THE_BALANCE = 'rb'

  def initialize
    @auth = Autorizate.new
    @cinema_engine = CinemaEngine.new
    @personal_account = PersonalAccount.new
  end

  def run
    loop do
      self.authorizate unless @auth.current_user
      self.choise
    end
  end

  def authorizate
    p "Do you want sign in(#{SIGN_IN}) or sign up(#{SIGN_UP})?"
    action = gets.chomp
    case action
    when SIGN_IN
      @auth.sign_in

    when SIGN_UP
      @auth.sign_up
    else
      self.run
    end
    @personal_account.setUser(@auth.current_user)
    @cinema_engine.setUser(@auth.current_user.id)
  end

  def choise
    p "Do you want go to personal account(#{PERSONAL_ACCOUNT}), buy new ticket(#{TICKETS}) or replenish the balance(#{REPLENISH_THE_BALANCE})?"
    action = gets.chomp
    case action
    when PERSONAL_ACCOUNT
      @personal_account.show_personal_information
    when REPLENISH_THE_BALANCE
      @personal_account.wallet.replenish_balance
    when TICKETS
      chosen_ticket = @cinema_engine.buy_new_ticket
      p chosen_ticket.seanse[:price]
      @personal_account.wallet.change_balance('minus', chosen_ticket.seanse[:price])
    end
  end

end