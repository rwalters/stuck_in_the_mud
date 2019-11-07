class Stuck
  has_many :players

  def initialize(num_players = 6)
    @players = Array.new(num_players){ Player.new }
  end

  def leaderboard
    players.sort_by(&:score)
  end

  def play
    loop do
      active_players =  players.select(&:can_play?)
      break unless active_players.count > 0

      active_players.each(&:play)
    end
  end

  class Player
    attr_accessor :rounds, :num_dice

    def initialize
      @rounds = []
      @num_dice = 5
    end

    def score
      rounds.map(&:score).sum
    end

    def can_play?
      num_dice > 0
    end

    def play_round
      return unless can_play?
      round = Round.new(num_dice)
      @num_dice = round.reject{|i| [2,5].include?(i) }.count
      @rounds << round
    end
  end

  class Round
    attr_accessor :dice

    def initialize(num_dice = 5)
      @dice = Array.new(num_dice){ rand(1..6) }
    end

    def score
      dice.sum
    end
  end
  attr_accessor :score, :dice

  STUCK_VALUES = [2,5]
  MAX_ROLLS = 100

  def initialize(dice = 5)
    @dice = dice
    @roll_count = 0
    @score = 0
  end

  def play
    while @dice > 0 && @roll_count <= MAX_ROLLS
      @dice.times { @score += roll() }
    end
    @score
  end

  private

  def roll
    @roll_count += 1
    ret = rand(1..6)
    @dice -= 1 if STUCK_VALUES.include?(ret)
    ret
  end

end
