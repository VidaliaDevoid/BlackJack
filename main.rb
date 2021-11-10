require_relative 'card'
require_relative 'player'
require_relative 'dealer'
require_relative 'self_player'
require_relative 'deck'
require_relative 'bank'

bank = Bank.new

me = SelfPlayer.new('Natasha')
dealer = Dealer.new
deck = Deck.new

deck.start_cards(me)
deck.start_cards(dealer)

me.cards.sort_by{|c| c.number == 'T' ? 0 : 1}.reverse

class Main
  def start_game
    print 'Hello! Put your name: '
    name = gets.chomp

    player = SelfPlayer.new(name)
    dealer = Dealer.new
    bank = Bank.new

    deck = Deck.new

    deck.start_cards(player)
    deck.start_cards(dealer)

    player.place_bet(bank)
    dealer.place_bet(bank)

    player_turn(deck, dealer, player)
  end

  def player_turn(deck, dealer, player)
    menu = [
      '1) Pass',
      '2) Add card',
      '3) Calculate points (end game)'
    ]
    menu.each { |point| puts point }

    loop do
      puts '--------------------------'
      puts 'Your cards: '
      player.show_cards
      puts '--------------------------'
      puts "Your score: #{player.calculate_points}"
      puts '--------------------------'

      print 'What to do? '
      point = gets.strip

      case point
        when '1' then dealer_turn(deck, dealer, player)
        when '2' then deck.add_card(player)
        when '3' then 'end game'
        else puts 'Wrong number point.'
      end
    end
  end

  def dealer_turn(deck, dealer, player)
    puts 'dealer turn'

    if dealer.points >=17
      puts 'Dealer pass.'
      player_turn(deck, dealer, player)
    else
      deck.add_card(dealer)
    end
  end
end

Main.new.start_game
