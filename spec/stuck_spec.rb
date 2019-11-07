require 'stuck'

RSpec.describe Stuck do
  subject(:game) { described_class.new }

  describe '#play' do
    it "always returns a positive score" do
      expect(game.play).to be > 0
    end

  end


end
