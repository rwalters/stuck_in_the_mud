require 'stuck'

RSpec.describe Stuck do
  subject(:game) { described_class.new(player_names) }

  let(:player_names) { %w[Albert Barry Charlie Dwayne] }

  it "rolls dice" do
    expect(game.play).to be_an Array
  end
end
