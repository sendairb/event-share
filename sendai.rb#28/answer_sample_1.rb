class Slot

  def initialize(return_rate, winning_rate)
    @return_rate = return_rate
    @winning_rate = winning_rate
  end

  # 逐次的凝集
  def spin(bet)
    if bet.zero?
      puts 'Bet to spin!'
      return
    end
    win? ? bet * @return_rate : 0
  end

  private

  # 機能的凝集
  def win?
    lottery_numbers = (1..1000).to_a
    pickuped = lottery_numbers.sample
    lottery_numbers.sample(1000 * @winning_rate).include?(pickuped)
  end

end

# 逐次的凝集
slot = Slot.new(1.7, 0.25)
puts slot.spin(300)
puts slot.spin(400)
