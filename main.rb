require_relative 'card'
require_relative 'player'
require_relative 'dealer'
require_relative 'self_player'
require_relative 'deck'

me = SelfPlayer.new('Natasha')
dealer = Dealer.new
deck = Deck.new

deck.start_cards(me)

deck.start_cards(dealer)
