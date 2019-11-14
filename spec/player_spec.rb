require 'player'
require 'support/fake_rand'

RSpec.describe Player do
  subject { player }

  let(:player) { described_class.new }

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
    let(:player) { described_class.new(dice: fake_dice) }

    let(:fake_dice) { Dice.new(5, rng) }
    let(:rng)       { FakeRand.new(ary) }
    let(:ary)       { [1,2,3,4,5] }
    let(:valid_ary) { ary.reject{|i| [2,5].include?(i) } }

    it "returns the expected roll" do
      expect(player.roll).to eq(valid_ary.sum)
    end

    describe "#current_score" do
      subject(:current_score) { player.current_score }

      context "before rolling" do
        it { is_expected.to eq(0) }
      end

      context "after rolling" do
        before { player.roll }
        let(:valid_total) { valid_ary.inject(:+) }

        it { is_expected.to eq(valid_total) }
      end

      (3..7).each do |iter|
        context "after rolling multiple times" do
          before do
            iter.times { player.roll }
          end

          let(:valid_total) { ary.sum }
          let(:valid_vals)  { [1,3,4,6] }
          let(:val_proc)    { ->{ valid_vals.sample } }
          let(:ary_size)    { iter * 5 }
          let(:ary)         { Array.new(ary_size){ val_proc.call } }

          it { is_expected.to eq(valid_total) }
        end
      end
    end

    describe "#dice_left" do
      before { player.roll }

      subject(:dice_left) { player.dice_left }

      it { is_expected.to eq 3 }

      context "after rolling all 2's and 5's" do
        let(:ary) { [2,2,2,5,5] }

        it { is_expected.to eq 0 }
      end
    end

    describe "#stuck?" do
      subject(:stuck) { player.stuck? }

      it { is_expected.to be false }

      context "after rolling all 2's and 5's" do
        before { player.roll }

        let(:ary) { [2,2,2,5,5] }

        it { is_expected.to be true }
      end
    end
  end
end
