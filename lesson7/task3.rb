# 1) Спортивный тренажёр
# Тренажёр представляет собой снаряд для бега или ходьбы со звуковым сопровождением шагов. Имеется 2 кнопки управления: кнопка «время +1 мин», «режим бег/ходьба» и переключатель скорости 1-2-3. Кнопка «время +1 мин» включает тактовый генератор на 1 минуту или добавляет 1 мин, если он был уже включен. В режиме шагов генератор выдаёт импульсы с частотой 60 шагов в минуту не зависимо от показания тумблера скорости. В режиме «бег» генератор создаёт импульсы с частотой:
#                                                                                                                                                                                                                                                                                                                                                                                                                                                                             – 120 шагов в минуту на 1 скорости;
# – 180 шагов в минуту на 2 скорости;
# – 240 шагов в минуту на 3 скорости.
#   При этом во время бега тумблер скорости можно переключать только после 1 минуты бега. Начальная конфигурация: «ходьба» , 1-я скорость.


class Trainer
  MINUTE = 10

  def initialize
    @mode = 'walking'
    @speed = 1
    @time = 0
    @run_time = 0
  end

  def start_threads
    t1 = Thread.new{add_minute}
    t2 = Thread.new{get_input}
    t1.join
    t2.join
  end

  def add_minute
    steps = 0
    loop do
      while @run_time < @time do
        steps += 1
        p "top #{steps}"
        sleep(step_time)
        @run_time += step_time
      end
    end
  end

  def get_input
    loop do
      p "Your settings: mode #{@mode}, speed: #{@speed}"
      p 'You can switch the button to run/walk(m), add 1 minute(+1) or toggle speed(1/2/3)'
      get = gets.strip
      if get == 'm'
        if @time >= MINUTE
          @mode = @mode == 'walking' ? 'run' : 'walking'
          p "You swiched to #{@mode}"
        else
          p "You can't swiched! You must walking 1 minute!"
        end
      elsif get == '+1'
        @time += MINUTE
      elsif get == '1' || get == '2' || get == '3'
        @speed = get.to_i
        p "You swiched to #{get} speed"
      else
        p "Error! #{get} button doesn't exist"
      end
    end
  end

  def step_time
    if @mode == 'walking'
      1
    else
      1.0 / (@speed + 1)
    end
  end
end

t = Trainer.new
t.start_threads
