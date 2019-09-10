class Stuck
  def roll(dice = Array.new(5))
    dice.map{ rand(1..6) }
  end
end
