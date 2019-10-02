require 'die'

RSpec.describe Die do
  subject(:die) { described_class.new }

  it "rolls die" do
    expect(die.roll).to be > 0
  end

  it "saves value" do
    val = die.roll
    expect(die.value).to eq(val)
  end
end
