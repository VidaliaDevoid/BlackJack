module InfoHelper
  def show_menu
    menu = [
      '1) Pass',
      '2) Add card',
      '3) Calculate points (end game)'
    ]
    menu.each { |point| puts point }
  end

  def show_player_info(player)
    puts '--------------------------'
      puts 'Your cards: '
      player.show_cards
      puts '--------------------------'
      puts "Your money: #{player.money}"
      puts '--------------------------'
      puts "Your score: #{player.calculate_points}"
      puts '--------------------------'
  end
end
