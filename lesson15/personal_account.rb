require_relative 'user'
require_relative 'wallet'
class PersonalAccount
  attr_reader :user, :wallet
  def initialize(id, login, password)
    @user = User.new(id, login, password)
    @wallet = Wallet.new(id)
    @tickets = nil
  end

  def show_personal_information
    p "Hi, #{@user.name}"
    p "Your ammount is #{@wallet.balance}$"
    p "Your tickets are "
  end

end