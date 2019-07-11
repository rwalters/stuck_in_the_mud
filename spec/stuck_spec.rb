require 'stuck'

RSpec.describe Stuck do
  subject(:game) { described_class.new }

  context "#roll_dice" do
    it "rolls dice" do
      expect(subject.roll_dice).to be_a Array
    end

    it "removes 2s and 5s" do
      subject.roll_dice.each do |die|
        expect(die).to_not eq(2)
        expect(die).to_not eq(5)
      end
    end

    context "when game is over" do
      it "returns nil" do
        allow(subject).to receive(:dice_set).and_return([])
        expect(subject.roll_dice).to eq(nil)
      end
    end
  end

  context "#over?" do
    it "retuns false if there are valid rolls left" do
      allow(subject).to receive(:dice_set).and_return([3])
      expect(subject.over?).to eq(false)
    end

    it "returns true if there aren't any valid rolls left" do
      allow(subject).to receive(:dice_set).and_return([])
      expect(subject.over?).to eq(true)
    end
  end

  context "#score" do
    context "when the game has started" do
      it "retuns 0" do
        expect(subject.score).to eq(0)
      end
    end

    context "when the game is underway" do
      it "returns the expected score" do
        expect(subject.score).to eq(0)
        subject.roll_dice
        expect(subject.score).to be > 0
      end
    end
  end
end
