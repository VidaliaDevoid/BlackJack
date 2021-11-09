class Card
  attr_accessor :color, :number
# Diamonds (Бубы / Алмазы)
# Hearts (Черви / Сердца)
# Clubs (Трефы / Клубы)
# Spades (Пики / Лопаты)
  def initialize(color, number)
    @color  = color
    @number = number
    # @cost = cost
  end
end
