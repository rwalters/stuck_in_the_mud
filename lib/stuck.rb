class Stuck
  def initialize
    @dice_set = Array.new(5){ rand(1..6) }
    @score = 0
  end

  attr_reader :dice_set, :score

  def over?
    dice_set.empty?
  end

  def roll_dice
    return nil if over?
    dice_set.map!{ rand(1..6) }
    dice_set.reject!{ |die| die == 2 || die == 5 }
    @score = @score + dice_set.sum
    dice_set
  end
end
