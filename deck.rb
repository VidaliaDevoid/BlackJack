class Deck
  attr_accessor :cards

  COLORS = ['diamond', 'heart', 'club', 'spade']
  NUMBERS = ['6', '7', '8', '9', '10', 'V', 'D', 'K', 'T']

  def initialize
    @cards = []
    create_deck
  end

  def create_deck
    COLORS.each { |color|
      NUMBERS.each { |number|
        @cards << Card.new(color, number)
      }
    }
  end

  def remove_card(number)
    @cards.delete_at(number)
  end

  def start_cards(forwho)
    2.times {
      # select random card
      number = rand(0..@cards.count-1) 

      forwho.cards << @cards[number]
      @cards.delete_at(number)
    }
  end
end
