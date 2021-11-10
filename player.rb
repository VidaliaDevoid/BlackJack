class Player
attr_accessor :money, :points, :name

  def initialize(name)
    @name  = name
    @money = 100
    @cards = []
    @points = 0
  end

  def place_bet(bank)
    raise ("#{@name} have no money...") if money == 0
    @money -= 10
    bank.add_money(10)
  end

  def remove_cards
    @cards = []
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

  def take_prize(bank)
    puts "#{name} wins!"
    bank.give_prize(self)
  end
end
