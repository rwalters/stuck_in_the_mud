require 'player'

RSpec.describe Player do
  class FakeDice
    attr_reader :dice

    def self.roll(_a, _b)
      new.roll
    end

    def initialize(_ = nil, _ = nil)
      @dice = [1,2,3,4,5]
    end

    def roll
      self
    end

    def valid_dice
      dice
        .reject{|i| i == 2 }
        .reject{|i| i == 5 }
    end
  end

  subject(:player) { described_class.new(fake_dice) }

  let(:fake_dice) { FakeDice }

  it "rolls dice" do
    expect(player.roll).to be_an Integer
  end

  it "returns the expected roll" do
    expect(player.roll).to eq([1,3,4].sum)
  end

  describe "#current_score" do
    context "before rolling" do
      it "is zero" do
        expect(player.current_score).to eq(0)
      end
    end

    context "before rolling" do
      before { player.roll }

      it "returns the cumulative score" do
        expect(player.current_score).to eq([1,3,4].inject(:+))
      end
    end
  end
end
