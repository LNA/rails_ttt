class Game
  attr_accessor :ai,
                :board,
                :game_rules

  def initialize(ai, board, game_rules)
    @ai               = ai
    @board            = board
    @game_rules       = game_rules
  end
end