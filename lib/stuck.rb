require 'player'

class Stuck
  attr_reader :players

  def initialize(player_names)
    @players = player_names.map{|name| Player.new(name: name) }
  end

  def play
    players.map(&:roll)
  end
end
