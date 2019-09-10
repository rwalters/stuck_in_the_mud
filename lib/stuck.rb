class Stuck
  def initialize(rng = nil)
    @rng = rng || Random.new
  end

  def roll(dice = Array.new(5))
    dice.map{ rng.rand(1..6) }
  end

  private

  attr_reader :rng
end
