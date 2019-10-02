require 'player'

class Game
  attr_reader :players, :winner

  def initialize(num_players, player_class = Player)
    @players = Array.new(num_players){ player_class.new }
  end

  def play
    players.each(&:take_turn)
    @winner = players.max{|i| i.score }
  end
end
