class Dice
  def self.roll(num_dice = 5, rng = nil)
    new(num_dice, rng).roll
  end

  attr_reader :dice

  def initialize(num_dice = 5, rng = nil)
    @rng = rng || Random.new
    @dice = Array.new(num_dice)
  end

  def to_s
    dice
  end

  def roll
    @dice = valid_dice.map{ rng.rand(1..6) }

    self
  end

  def valid_dice
    dice
      .reject{|i| i == 2 }
      .reject{|i| i == 5 }
  end

  private

  attr_reader :rng
end
