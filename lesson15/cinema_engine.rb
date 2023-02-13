require_relative 'autorizate'
require_relative 'user'

class CinemaEngine
  def initialize
    @seanses = Movies.new
  end

  def buy_new_ticket_menu_1
    @seanses.show_seanses
    p 'Do you want to choose any filter?'
    buy_new_ticket_menu_2
  end

  def buy_new_ticket_menu_2
    p 'Press number of seanse:'
    number = gets.chomp.to_i
    case number
    when 1
      self.buy_new_ticket_menu_3(number)
    end
  end
  def buy_new_ticket_menu_3(number)
    p 'Are you sure?'

    @seanses.show_chosen_seanse(number)
    id_key = @seanses.keys.size + 1
    File.open("ticket#{id_key}.txt", "w") do |file|
      file.write("#{Movies.show_chosen_seanse(number)}")
    end

  end
end