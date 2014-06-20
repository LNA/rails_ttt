class MockGame
  attr_accessor :ai, 
                :board,
                :game_rules, 
                :player_factory

  def initialize(ai, board, game_rules, player_factory)
    @ai         = ai
    @board      = board
    @game_rules = game_rules
    @player_factory   = player_factory
  end
end