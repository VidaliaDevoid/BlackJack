class Bank
  attr_accessor :sum
  
  def initialize
    @sum = 0
  end

  def add_money(money)
    @sum += money
  end

  def give_prize(forwho)
    forwho.money += sum
    @sum = 0
  end

  def return_bet(player, dealer)
    player.money += 10
    dealer.money += 10
    
    @sum -= 20
  end
end
