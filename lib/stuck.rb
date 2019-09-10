class Stuck
  def roll(dice = 5)
    Array.new(dice){ rand(1..6) }
  end
end
