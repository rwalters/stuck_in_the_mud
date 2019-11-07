require 'player'

class Stuck
  attr_reader :players

  def initialize(num_players = 6)
    @players = Array.new(num_players){ Player.new }
  end

  def play
    players.map(&:roll)
  end
end
