class Player
attr_accessor :money, :points

  def initialize(name)
    @name  = name
    @money = 100
    @cards = []
    @points = 0
  end

  def place_bet(bank)
    @money -= 10
    bank.add_to_bank(10)
  end

  def sort_cards
    cards.sort
  end 

  def calculate_points
    sum = 0
    cards = @cards.sort_by{|c| c.number == 'T' ? 0 : 1}.reverse

    cards.each { |card|
      sum += card.get_cost(sum)
    }

    sum
  end 
end
