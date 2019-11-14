require 'stuck'

RSpec.describe Stuck do
  subject { game }
  let(:game) { described_class.new(player_names) }

  let(:player_names) { %w[Albert Barry Charlie Dwayne] }

  describe "#play" do
    subject { game.play }

    it "rolls dice" do
      is_expected.to be_an Array
    end
  end

  describe "#complete?" do
    before { game.play }

    subject { game.complete? }

    it { is_expected.to be false }

    context "one player has no dice left" do
      before do
        loop do
          break if game.players.any?{|pl| pl.dice_left == 0 }

          game.players.each do |player|
            player.roll
          end
        end
      end

      it { is_expected.to be false }
    end

    context "no player has dice left" do
      before do
        loop do
          break if game.players.all?{|pl| pl.dice_left == 0 }

          game.players.each do |player|
            player.roll
          end
        end
      end

      it { is_expected.to be true }
    end
  end
end
