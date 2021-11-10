class Dealer < Player
  attr_accessor :cards, :money

  def initialize
    super('Dealer')
  end
end
