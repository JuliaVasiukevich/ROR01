# frozen_string_literal: true

# Взять несколько предметов, которые вас окружают, и описать их, как классы. Создать по объекту каждого класса, сравнить их поведение.

class TV
  def initialize(turn_on, channels_set)
    @turn_on = turn_on
    @channels_set = channels_set
  end

  def turn_off_or_on
    @turn_on = !@turn_on
    status
  end

  def status
    on_or_off = @turn_on ? 'TV is on!' : 'TV is off!'
    p on_or_off
    p "Your channels set #{@channels_set}"
  end

  def add_channel(channel)
    return status unless @turn_on

    if @channels_set.include? channel
      p "TV channel #{channel} exist!"
    else
      @channels_set.push(channel)
      p "TV channel #{channel} added!"
    end
    status
  end

  def delete_channel(channel)
    return status unless @turn_on

    if @channels_set.include? channel
      @channels_set.delete(channel)
      p "TV channel #{channel} deleted!"
    else
      p "TV channel #{channel} not exist!"
    end
    status
  end
end

class Microwave
  def initialize(turn_on)
    @turn_on = turn_on
  end

  def new_temperature_of_product(temperature, time_of_work)
    return 'Turn on your microwave!' unless @turn_on

    new_temperature = temperature + time_of_work / 2
    p "New temperature is #{new_temperature}"
  end

  def turn_off_or_on
    @turn_on = !@turn_on
    status
  end

  def status
    on_or_off = @turn_on ? 'microwave is on!' : 'microwave is off!'
    p on_or_off
  end
end

tv = TV.new(true, %w[national belarus1 history])
tv.turn_off_or_on
tv.add_channel('national')
tv.add_channel('discovery')
tv.delete_channel('discovery')
tv.delete_channel('discovery')
tv.turn_off_or_on
tv.add_channel('national')
tv.add_channel('discovery')
tv.delete_channel('discovery')
tv.delete_channel('discovery')

micro = Microwave.new(false)
micro.new_temperature_of_product(10, 12)
micro.turn_off_or_on
micro.new_temperature_of_product(10, 12)
