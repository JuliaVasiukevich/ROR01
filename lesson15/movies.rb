class Movies
  movies = { titanic: { title: 'Titanic', genre: 'drama', timing: '2h 24min' } }

  SEANSES = [{ time: '19:00', price: 20, film: movies[:titanic] },
             { time: '23:00', price: 10, film: movies[:titanic] },
             { time: '16:00', price: 15, film: movies[:titanic] }]

  attr_reader :seanses_count

  def initialize
    @seanses_count = SEANSES.size
  end

  def show_seanses
    count = 0
    p 'We have following seanses:'
    SEANSES.map do |seans|
      count += 1
      p "#{count}    Time: #{seans[:time]} hall:#{seans[:price]} film: #{seans.dig(:film, :title)}, #{seans.dig(:film, :genre)}, #{seans.dig(:film, :timing)}"
    end
  end

  def show_chosen_seanse(number)
    p seans = SEANSES[number - 1]
    p "Time: #{seans[:time]} hall:#{seans[:price]} film: #{seans.dig(:film, :title)}, #{seans.dig(:film, :genre)}, #{seans.dig(:film, :timing)}"
    seans
  end
end