require 'player'

RSpec.describe Player do
  class FakeRand
    def initialize(ary = nil)
      @ary = ary || (1..99).to_a
    end

    def rand(*args)
      @ary.shift
    end
  end

  subject(:game) { described_class.new(rng) }

  let(:rng) { FakeRand.new(ary) }
  let(:ary) { [1,1,1,1,1] }


  it "rolls dice" do
    expect(game.roll).to be_an Array
  end

  it "rolls the expected number of dice" do
    expect(game.roll([1,2,3]).count).to eq(3)
  end

  it "returns the expected roll" do
    expect(game.roll).to eq([1,1,1,1,1])
  end

  context "when 2's and 5's are rolled" do
    let(:ary) { [1,2,3,4,5] }
    it "excludes 2's and 5's" do
      expect(game.roll).to eq([1,3,4])
    end
  end
end
