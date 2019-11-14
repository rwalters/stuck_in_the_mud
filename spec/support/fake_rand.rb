class FakeRand
  def initialize(ary = nil)
    @ary = ([] + (ary || (1..99).to_a))
  end

  def rand(*args)
    @ary.shift
  end
end

