require 'securerandom'
require 'dice'

class Player
  attr_reader :dice, :rounds, :name

  def initialize(name: SecureRandom.base64(9), dice: Dice.new)
    @name = name
    @dice = dice
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

  def dice_left
    dice.valid_dice.count
  end

  def stuck?
    dice_left == 0
  end
end
