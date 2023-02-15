require_relative 'user'
require_relative 'wallet'
require_relative 'ticket'
class PersonalAccount
  attr_reader :user, :wallet
  def initialize
    @user = nil
    @wallet = nil
    @tickets = []
  end

  def show_personal_information
    p "Hi, #{@user.name}"
    p "Your ammount is #{@wallet.balance}$"
    print "Your tickets are "
    p self.show_personal_tickets.empty? ? 'empty': self.show_personal_tickets
  end

  def show_personal_tickets
    file = File.open("tickets.txt")
    file.each_line do |line|
      id, ticket = line.strip.split(";")
      @tickets << ticket if id == @user.id
    end

    @tickets
  end

  def setUser(user)
    @user = user
    @wallet = Wallet.new(@user.id)
  end

end