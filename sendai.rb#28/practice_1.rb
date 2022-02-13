class Slot

  RATE_CONFIG = {
    return_rate: 1.7,
    winning_rate: 0.25
  }

  def initialize(money)
    @bet = money
  end

  def spin
    if @bet.zero?
      puts 'Bet to spin!'
      return
    end

    lottery_numbers = (1..1000).to_a
    pickuped = lottery_numbers.sample
    win = lottery_numbers.sample(1000 * RATE_CONFIG[:winning_rate]).include?(pickuped)

    prize = win ? @bet * RATE_CONFIG[:return_rate] : 0
    @bet = 0
    prize
  end

  def bet(money)
    @bet += money
  end

  def change_return_rate(new_rate)
    RATE_CONFIG[:return_rate] = new_rate
  end

  def change_winning_rate(new_rate)
    RATE_CONFIG[:winning_rate] = new_rate
  end
end

slot = Slot.new(120)
puts slot.spin

slot.bet(250)
puts slot.spin
