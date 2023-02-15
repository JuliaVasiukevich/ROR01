require_relative 'autorizate'
require_relative 'user'
require_relative 'movies'
require_relative 'ticket'

class CinemaEngine
  def initialize
    @seanses = Movies.new
    @user_id = nil
  end

  def setUser(user_id)
    @user_id = user_id
  end

  def buy_new_ticket
    @seanses.show_seanses
    p 'Do you want to choose any filter?'
    #TODO: Не дошли руки доделать фильтры
    p 'Press number of seanse:'
    number = gets.chomp.to_i
    p number
    if (1..@seanses.seanses_count).include? number
      choose = @seanses.show_chosen_seanse(number)
      new_ticket = Ticket.new(@user_id, choose)
      new_ticket.buy_ticket
    else
      p 'This number doesn`t exist'
    end

    choose = @seanses.show_chosen_seanse(number)
    Ticket.new(@user_id, choose)
  end
end