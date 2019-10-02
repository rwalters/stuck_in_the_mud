require 'game'

RSpec.describe Game do
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

  subject(:game) { described_class.new(num_players) }
  let(:num_players) { 5 }

  it "has 5 players" do
    expect(game.players.count).to eq(num_players)
  end

  describe "#play" do
    it "winner is not nil" do
      game.play
      expect(game.winner).to_not be_nil
    end

    it "winner has a score" do
      game.play
      expect(game.winner.score).to be > 0
    end
  end
end
