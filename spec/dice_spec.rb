require 'dice'

RSpec.describe Dice do
  class FakeRand
    def initialize(ary = nil)
      @ary = ([] + (ary || (1..99).to_a))
    end

    def rand(*args)
      @ary.shift
    end
  end

  subject(:dice) { roll.dice }

  let(:roll) { described_class.roll(num_dice, rng) }
  let(:num_dice) { 5 }
  let(:rng) { FakeRand.new(ary) }
  let(:ary) { Array.new(5){ 1 } }

  it "returns an array of results" do
    is_expected.to be_an Array
  end

  it "returns expected number of dice" do
    is_expected.to eq ary
  end

  context "with the number of dice" do
    let(:num_dice) { 3 }

    it "returns expected number of dice" do
      is_expected.to eq([1,1,1])
    end
  end

  context "when 2's and 5's are rolled" do
    let(:ary) { [1,2,3,4,5] }

    it "returns all dice" do
      is_expected.to eq(ary)
    end

    it "#valid_dice ignores 2's and 5's" do
      roll

      expect(roll.valid_dice).to eq([1,3,4])
    end
  end
end
