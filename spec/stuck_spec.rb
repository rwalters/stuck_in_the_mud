require 'stuck'

RSpec.describe Stuck do
  subject(:game) { described_class.new }

  it "rolls dice" do
    expect(game.roll).to be_an Array
  end

  it "rolls the expected number of dice" do
    expect(game.roll([1,2,3]).count).to eq(3)
  end
end
