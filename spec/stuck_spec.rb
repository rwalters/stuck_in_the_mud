require 'stuck'

RSpec.describe Stuck do
  subject(:game) { described_class.new }

  it "rolls dice" do
    expect(game.play).to be_an Array
  end
end
