class Movies
  movies = {titanic: {title: 'Titanic', genre: 'drama', timing:'2h 24min'}}

  SEANSES = [{time: '19:00', hall: '1', film: movies[:titanic]}]

  def show_seanses
    count = 0
    p 'We have following seanses:'
    SEANSES.map do |seans|
      count += 1
      seans[:count] = count
      p "#{count}    Time: #{seans[:time]} hall:#{seans[:hall]} film: #{seans.dig(:film, :title)}, #{seans.dig(:film, :genre)}, #{seans.dig(:film, :timing)}"
    end
  end

  def show_chosen_seanse(number)
    seans = SEANSES.find {|seans| seans[:count] = number}
    p "Time: #{seans[:time]} hall:#{seans[:hall]} film: #{seans.dig(:film, :title)}, #{seans.dig(:film, :genre)}, #{seans.dig(:film, :timing)}"
    seans
  end
end