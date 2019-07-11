require 'stuck'

RSpec.describe Stuck do
  subject(:game) { described_class.new }

  it "rolls dice" do
    expect(game.roll).to be > 0
  end
end
