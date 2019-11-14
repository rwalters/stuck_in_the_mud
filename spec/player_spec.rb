require 'player'
require 'support/fake_rand'

RSpec.describe Player do
  subject(:player) { described_class.new }

  it "rolls dice" do
    expect(player.roll).to be_an Integer
  end

  it { expect(player.name.length).to eq 12 }
  it { expect(player.name).to be_a String }

  context "with Name" do
    subject(:player) { described_class.new(name: name).name }
    let(:name) { 'Charlie Bucket' }

    it { is_expected.to eq name }
  end

  context "with Dice" do
    subject(:player) { described_class.new(dice: fake_dice) }

    let(:fake_dice) { Dice.new(5, rng) }
    let(:rng)       { FakeRand.new(ary) }
    let(:ary)       { [1,2,3,4,5] }
    let(:valid_ary) { ary.reject{|i| [2,5].include?(i) } }

    it "returns the expected roll" do
      expect(player.roll).to eq(valid_ary.sum)
    end

    describe "#current_score" do
      subject(:current_score) { player.current_score }

      let(:player) { described_class.new(dice: fake_dice) }

      context "before rolling" do
        it { is_expected.to eq(0) }
      end

      context "after rolling" do
        before { player.roll }
        let(:valid_total) { valid_ary.inject(:+) }

        it { is_expected.to eq(valid_total) }
      end
    end
  end
end
