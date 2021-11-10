require_relative 'card'
require_relative 'player'
require_relative 'dealer'
require_relative 'self_player'
require_relative 'deck'
require_relative 'bank'
require_relative 'info_helper'

class Main
  include InfoHelper

  def start_game
    print 'Hello! Put your name: '
    name = gets.chomp

    player = SelfPlayer.new(name)
    dealer = Dealer.new
    bank = Bank.new
    asnwer = 'yes'

    begin
      deck = Deck.new
      player.remove_cards
      dealer.remove_cards

      deck.start_cards(player)
      deck.start_cards(dealer)

      begin
        player.place_bet(bank)
        dealer.place_bet(bank)
      rescue StandardError => e
        puts e.message
        break
      end

      if asnwer == 'yes'
        player_turn(deck, dealer, player, bank)
      end

      print 'Wanna play more? (yes/no): '
      asnwer = gets.strip

    end while asnwer == 'yes'
  end

  def player_turn(deck, dealer, player, bank)
    show_menu

    loop do
      show_player_info(player)

      print 'What to do? '
      point = gets.strip

      case point
        when '1' then dealer_turn(deck, dealer, player, bank)
        when '2' then deck.add_card(player)
        when '3' then
          end_game(player, dealer, bank) 
          break
        else puts 'Wrong number point.'
      end
    end
  end

  def dealer_turn(deck, dealer, player, bank)
    puts '---------Dealer turn.'

    dealer.points = dealer.calculate_points

    if dealer.points >= 17
      puts '---------Dealer pass!'
    else
      deck.add_card(dealer)
    end
    puts '==================================='
  end
end

def end_game(player, dealer, bank)
  puts '==================================='
  player.points = player.calculate_points
  dealer.points = dealer.calculate_points

  player_in_game = check_not_excess(player)
  dealer_in_game = check_not_excess(dealer)

  puts "Player points: #{player.points}"
  puts "Dealer points: #{dealer.points}"

  if player_in_game && dealer_in_game
    winner = get_winner(player, dealer)

    if winner
      winner.take_prize(bank)
    else
      puts "Draw! Return bet for each player."
      bank.return_bet(player, dealer)
    end
  elsif player_in_game && !dealer_in_game
    player.take_prize(bank)
  elsif !player_in_game && dealer_in_game
    dealer.take_prize(bank)
  else
    # both lost the round
    puts "Both lost the round! Return bet for each player."
    bank.return_bet(player, dealer)
  end
end

def check_not_excess(player)
  if player.points > 21
    puts "#{player.name} lost the round with score: #{player.points}!"
    false
  else
    true
  end
end

def get_winner(player, dealer)
  if player.points > dealer.points
    player
  elsif player.points < dealer.points
    dealer
  end
end

Main.new.start_game
