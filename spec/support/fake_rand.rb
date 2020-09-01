class FakeRand
  def initialize(ary = nil)
    @ary = ([] + (ary || (1..99).to_a))
  end

  def rand(*args)
    t = @ary.shift
    @ary.push(t)
    t
  end
end

