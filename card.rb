class Card
  attr_accessor :color, :number
# Diamonds (Бубы / Алмазы)
# Hearts (Черви / Сердца)
# Clubs (Трефы / Клубы)
# Spades (Пики / Лопаты)

  def initialize(color, number)
    @color  = color
    @number = number
  end

  def is_picture?
    Deck::PICTURES.include?(number)
  end

  def is_number?
    Deck::NUMBERS.include?(number)
  end

  def is_ace?
    number == 'T'
  end

  def get_cost(sum)
    if self.is_number? # 6 7 8 9 10
      @number.to_i
    elsif self.is_picture? # V D K 
      10
    elsif sum <= 10 # T
      11
    else 
      1
    end
  end
end
