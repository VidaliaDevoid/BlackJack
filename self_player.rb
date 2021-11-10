class SelfPlayer < Player
  attr_accessor :cards, :money

  def initialize(name)
    super(name)
  end

  def show_cards
    cards.each { |card|
      puts "number: #{card.number}, color: #{card.color}"
    }
  end

  def pass
    puts 'pass'
  end
end
