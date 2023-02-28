class Ticket

  attr_reader :seanse
  def initialize(user_id, seanse)
    @user_id = user_id
    @seanse = seanse
    @tickets = []
  end

  def buy_ticket
    File.open("tickets.txt", "a") do |file|
      file.write("#{@user_id};#{@seanse}\r\n")
    end
  end

end