require 'die'

class Player
  attr_reader :dice, :score

  def initialize(die_class = Die)
    @dice = Array.new(5){ die_class.new }
    @score = 0
  end

  def take_turn
    dice.map(&:roll)
    new_dice = []
    dice.each do |die|
      if die.value == 2 || die.value == 5
        #skip
      else
        new_dice << die
        @score += die.value
      end
    end
    @dice = new_dice

    if dice.count > 0
      take_turn
    else
      "Game Over! Score: #{score}"
    end
  end
end
