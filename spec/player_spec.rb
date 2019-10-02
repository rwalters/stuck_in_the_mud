require 'player'

RSpec.describe Player do
  class TestDieTwo
    def roll
    end

    def value
      2
    end
  end
  class TestDieTwo
    def roll
    end

    def value
      5
    end
  end

  subject(:game) { described_class.new }

  it "has 5 dice" do
    expect(game.dice.count).to eq(5)
  end

  it "has a score of zero" do
    expect(game.score).to eq 0
  end

  describe "#take_turn" do
    subject(:game) { described_class.new(TestDieTwo) }

    it "excludes 2's" do
      expect(game.take_turn).to match(/^Game Over! Score: 0$/)
    end
  end
end
