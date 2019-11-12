require 'dice'

class Player
  attr_reader :dice, :rounds

  def initialize(dice_class = Dice)
    @dice = dice_class.new
    @rounds = []
  end

  def current_score
    rounds.flatten.sum
  end

  def roll
    @dice = dice.roll
    @rounds << dice.valid_dice

    dice.valid_dice.sum
  end
end
