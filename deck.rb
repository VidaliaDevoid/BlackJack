class Deck
  attr_accessor :cards

  COLORS = ['diamond', 'heart', 'club', 'spade']
  NUMBERS = ['2', '3', '4', '5', '6', '7', '8', '9', '10']
  PICTURES = ['V', 'D', 'K']

  def initialize
    @cards = []
    create_deck
  end

  def create_deck
    COLORS.each { |color|
      NUMBERS.each { |number|
        @cards << Card.new(color, number)
      }

      PICTURES.each { |picture|
        @cards << Card.new(color, picture)
      }

      @cards << Card.new(color, 'T')
    }
  end

  def remove_card(number)
    @cards.delete_at(number)
  end

  def start_cards(forwho)
    2.times { add_card(forwho) }
  end

  def add_card(forwho)
    # select random card
    number = rand(0..@cards.count-1) 

    forwho.cards << @cards[number]
    @cards.delete_at(number)
  end 
end
