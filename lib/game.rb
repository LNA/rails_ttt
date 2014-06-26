class Game
  attr_accessor :ai,
                :board,
                :game_rules,
                :players

  def initialize(ai, board, game_rules, players)
    @ai               = ai
    @board            = board
    @game_rules       = game_rules
    @players          = players
  end
end