require 'stuck'

RSpec.describe Stuck do
  subject(:game) { described_class.new }

  it "rolls dice" do
    expect(game.roll).to be_an Array
  end
end
