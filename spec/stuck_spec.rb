require 'stuck'

RSpec.describe Stuck do
  class FakeRand
    def initialize(ary = nil)
      @ary = ary || (1..99).to_a
    end

    def rand(*args)
      @ary.shift
    end
  end

  subject(:game) { described_class.new(rng) }
  let(:rng) { nil }

  it "rolls dice" do
    expect(game.roll).to be_an Array
  end

  it "rolls the expected number of dice" do
    expect(game.roll([1,2,3]).count).to eq(3)
  end

  context "when passed an RNG" do
    let(:rng) { FakeRand.new }

    it "returns the expected roll" do
      expect(game.roll).to eq([1,2,3,4,5])
    end
  end
end
